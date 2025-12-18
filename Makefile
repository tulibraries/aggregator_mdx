DOCKERHUB_PASSWORD := $(subst ",\",$(DOCKERHUB_PASSWORD))

build: down
	@echo "Building xspec containers, networks, volumes"
	docker compose pull
	docker compose up --build -d --remove-orphans

saxon: build
	@echo "Running saxon cli"
	docker compose run saxon -s:${s} -xsl:${xsl} -o:${o}

test: build test-sch test-xslt test-coverage
	@echo "Testing xslt and schematron with Docker"

test-sch:
	@echo "Testing schematron with Docker"
	@status=0; \
	for xspectest in $(shell ls tests/schematron/*.xspec); do \
		echo "$$xspectest" ; \
		if ! docker compose run --rm xspec -s "$$xspectest" ; then \
			status=1; \
		fi; \
	done; \
	exit $$status

test-xslt:
	@echo "Testing xslt with Docker"
	@status=0; \
	for xspectest in $(shell ls tests/xslt/*.xspec); do \
		echo "$$xspectest" ; \
		if ! docker compose run --rm xspec "$$xspectest" ; then \
			status=1; \
		fi; \
	done; \
	exit $$status

test-ci: test-bash test-coverage

test-login:
	@docker login -u ${DOCKERHUB_USER} --password=$(DOCKERHUB_PASSWORD)

test-bash:
	@echo "CI/CD testing *.xspec with Docker & shell scripts"
	docker build -t xspec -f .docker/test/Dockerfile .
	bash .github/scripts/tests.sh

test-coverage:
	@echo "Test Coverage being generated"
	@count_total=0; count_exists=0; \
	for file in transforms/*.xsl; do \
		count_total=$$((count_total + 1)); \
		filename=$$(basename $$file); \
		name=$$(echo "$$filename" | cut -f 1 -d '.'); \
		if [ -f "tests/xslt/$$name.xspec" ]; then \
			count_exists=$$((count_exists + 1)); \
		fi; \
	done; \
	for file in validations/*.xsl; do \
		count_total=$$((count_total + 1)); \
		filename=$$(basename $$file); \
		name=$$(echo "$$filename" | cut -f 1 -d '.'); \
		if [ -f "tests/schematron/$$name.xspec" ]; then \
			count_exists=$$((count_exists + 1)); \
		fi; \
	done; \
	coverage=$$(awk -v count_exists=$$count_exists -v count_total=$$count_total 'BEGIN { if (count_total == 0) {print 0} else {print (count_exists / count_total) * 100} }'); \
	if awk -v cov=$$coverage 'BEGIN { exit (cov < 31) ? 0 : 1 }'; then \
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
