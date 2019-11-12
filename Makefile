up: down
	@echo "Building xspec containers, networks, volumes"
	docker-compose pull
	docker-compose up --build -d

saxon: up
	@echo "Running saxon cli"
	docker-compose run saxon -s:${s} -xsl:${xsl} -o:${o}

test: up test-sch test-xslt
	@echo "Testing xslt and schematron with Docker"

test-sch: up
	@echo "Testing schematron with Docker"
	for xspectest in $(shell ls tests/schematron/*.xspec); do \
		docker-compose run xspec -s "$$xspectest" ; \
	done

test-xslt: up
	@echo "Testing xslt with Docker"
	for xspectest in $(shell ls tests/xslt/*.xspec); do \
		docker-compose run xspec "$$xspectest" ; \
	done

test-travis:
	@echo "Travis testing *.xspec with Docker & shell scripts"
	bash .travis/run-tests.sh

stop:
	@echo "Stopping xspec containers, networks, volumes"
	docker-compose stop

down: stop
	@echo "Killing xspec containers, networks, volumes"
	docker-compose rm -fv
