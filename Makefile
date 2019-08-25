up: down
	@echo "Building xspec containers, networks, volumes"
	docker-compose pull
	docker-compose up --build -d

test: up
	@echo "Building xspec containers, networks, volumes"
	docker-compose run xspec "/transforms/dplah.xspec"
	docker-compose run xspec "/transforms/remediations/dedupe.xspec"

stop:
	@echo "Stopping xspec containers, networks, volumes"
	docker-compose stop

down: stop
	@echo "Killing xspec containers, networks, volumes"
	docker-compose rm -fv
