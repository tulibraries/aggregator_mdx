up: down
	@echo "Building xspec containers, networks, volumes"
	docker-compose pull
	docker-compose up --build -d

saxon: up
	@echo "Running saxon cli"
	docker-compose run saxon -s:${s} -xsl:${xsl} -o:${o}

test: up test-sch test-xslt
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

test-ci:
	@echo "CI/CD testing *.xspec with Docker & shell scripts"
	docker build -t xspec -f .docker/test/Dockerfile .
	bash .circleci/tests.sh

stop:
	@echo "Stopping xspec containers, networks, volumes"
	docker-compose stop

down: stop
	@echo "Killing xspec containers, networks, volumes"
	docker-compose rm -fv
