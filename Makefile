DOCKERHUB_PASSWORD := $(subst ",\",$(DOCKERHUB_PASSWORD))

build: down
	@echo "Building xspec containers, networks, volumes"
	docker compose pull
	docker compose up --build -d --remove-orphans

saxon: build
	@echo "Running saxon cli"
	docker compose run saxon -s:${s} -xsl:${xsl} -o:${o}

define run_xspec
	@failures=0; \
	for xspectest in $(1); do \
		[ -e "$$xspectest" ] || continue; \
		echo "$$xspectest"; \
		output=$$(docker compose run --rm xspec $(2) "$$xspectest"); \
		exit_code=$$?; \
		printf "%s\n" "$$output"; \
		if [ $$exit_code -ne 0 ] || printf "%s\n" "$$output" | grep -Eq 'failed:[[:space:]]*[1-9]|\*+ Error (running|compiling) the test suite'; then \
			echo "FAILED: $$xspectest"; failures=1; \
		else echo "OK: $$xspectest"; fi; \
	done; \
	exit $$failures
endef

test: build test-sch test-xslt test-coverage
	@echo "Testing xslt and schematron with Docker"

test-sch:
	@echo "Testing schematron with Docker"
	$(call run_xspec,tests/schematron/*.xspec,-s)

test-xslt:
	@echo "Testing xslt with Docker"
	$(call run_xspec,tests/xslt/*.xspec,)

test-ci:
	@status=0; \
	$(MAKE) test-xslt || status=1; \
	$(MAKE) test-sch || status=1; \
	$(MAKE) test-coverage || status=1; \
	exit $$status

test-login:
	@docker login -u ${DOCKERHUB_USER} --password=$(DOCKERHUB_PASSWORD)

test-bash:
	@echo "CI/CD testing *.xspec with Docker & shell scripts"
	docker build -t xspec -f .docker/test/Dockerfile .
	$(MAKE) test-xslt test-sch

test-coverage:
	@echo "Test Coverage being generated"
	@threshold=31; \
	count_total=0; \
	count_exists=0; \
	for pair in "transforms:tests/xslt" "validations:tests/schematron"; do \
		dir=$${pair%%:*}; \
		specdir=$${pair##*:}; \
		for file in $$dir/*.xsl; do \
			[ -e "$$file" ] || continue; \
			count_total=$$((count_total + 1)); \
			name=$$(basename "$$file" .xsl); \
			if test -f "$$specdir/$$name.xspec"; then \
				count_exists=$$((count_exists + 1)); \
			fi; \
		done; \
	done; \
	if [ $$count_total -eq 0 ]; then \
		echo "No XSL files found to calculate coverage."; \
		exit 1; \
	fi; \
	coverage=$$(awk -v c=$$count_exists -v t=$$count_total 'BEGIN { printf("%.4f", (c / t)*100) }'); \
	if awk -v c=$$coverage -v t=$$threshold 'BEGIN { exit (c < t ? 0 : 1) }'; then \
		echo "Test coverage is too low:"; \
		echo $$coverage; \
		exit 1; \
	fi; \
	echo "Test coverage is good:"; \
	echo $$coverage

stop:
	@echo "Stopping xspec containers, networks, volumes"
	docker compose stop

down: stop
	@echo "Killing xspec containers, networks, volumes"
	docker compose rm -fv
