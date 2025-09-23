DOCKERHUB_PASSWORD := $(subst ",\",$(DOCKERHUB_PASSWORD))

build: down
	@echo "Building xspec containers, networks, volumes"
	docker-compose pull
	docker-compose up --build -d

saxon: build
	@echo "Running saxon cli"
	docker-compose run saxon -s:${s} -xsl:${xsl} -o:${o}

test: build test-sch test-xslt test-coverage
	@echo "Testing xslt and schematron with Docker"

test-sch:
	@echo "Testing schematron with Docker"
	for xspectest in $(shell ls tests/schematron/*.xspec); do \
		echo "$$xspectest" ; \
		docker-compose run xspec -s "$$xspectest" ; \
	done

test-xslt:
	@echo "Testing xslt with Docker"
	for xspectest in $(shell ls tests/xslt/*.xspec); do \
		echo "$$xspectest" ; \
		docker-compose run xspec "$$xspectest" ; \
	done

test-ci: test-bash test-coverage

test-login:
	@docker login -u ${DOCKERHUB_USER} --password=$(DOCKERHUB_PASSWORD)

test-bash:
	@echo "CI/CD testing *.xspec with Docker & shell scripts"
	docker build -t xspec -f .docker/test/Dockerfile .
	bash .github/tests.sh

test-coverage:
	@echo "Test Coverage being generated"
	bash .github/coverage.sh

stop:
	@echo "Stopping xspec containers, networks, volumes"
	docker-compose stop

down: stop
	@echo "Killing xspec containers, networks, volumes"
	docker-compose rm -fv
