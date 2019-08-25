up: down
	@echo "Building xspec containers, networks, volumes"
	docker-compose pull
	docker-compose up --build -d

test: up
	@echo "Building xspec containers, networks, volumes"
	for xspectest in $(shell find transforms -type f -name '*.xspec'); do \
		docker-compose run xspec "/$$xspectest"  &> result.log ; \
		cat result.log ; \
		if grep -q ".*failed:\s[1-9]" result.log || grep -q -E "\*+\sError\s(running|compiling)\sthe\stest\ssuite" result.log ; \
			then \
				echo "FAILED: $xspectest"; echo "---------- result.log"; \
				cat result.log; echo "----------"; \
				exit 1; \
			else echo "OK: $xspectest"; \
		fi; \
	done

stop:
	@echo "Stopping xspec containers, networks, volumes"
	docker-compose stop

down: stop
	@echo "Killing xspec containers, networks, volumes"
	docker-compose rm -fv
