up: down
	@echo "Building xspec containers, networks, volumes"
	docker-compose pull
	docker-compose up --build -d

test: up
	@echo "Building xspec containers, networks, volumes"
	for xspectest in $(shell find transforms -type f -name '*.xspec'); do \
		docker-compose run xspec "/$$xspectest" ; \
	done

stop:
	@echo "Stopping xspec containers, networks, volumes"
	docker-compose stop

down: stop
	@echo "Killing xspec containers, networks, volumes"
	docker-compose rm -fv
