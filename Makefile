up: down
	@echo "Building xspec containers, networks, volumes"
	docker-compose pull
	docker-compose up --build -d

test: up
	@echo "Testing transforms/*.xspec with Docker"
	for xspectest in $(shell find transforms -type f -name '*.xspec'); do \
		docker-compose run xspec "/$$xspectest" ; \
	done
	@echo "Testing validations/*.xspec with Docker"
	for xspectest in $(shell find validations -type f -name '*.xspec'); do \
		docker-compose run xspec -s "/$$xspectest" ; \
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
