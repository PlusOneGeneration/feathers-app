help:
	@echo Development App console
	@echo
	@echo "frontend                     - Starts frontend"
	@echo "frontend.console             - Frontend console"

	@echo "backend                      - Starts backend"
	@echo "backend.console              - Starts backend console"

	@echo "redis.console                - Redis console"
	@echo "mongo.console                - MongoDB console"
	@echo

frontend:
	docker-compose up frontend

frontend.build:
	docker-compose build frontend

frontend.console:
	docker-compose run frontend bash

backend:
	docker-compose up backend

backend.build:
	docker-compose build backend

backend.console:
	docker-compose run backend bash

redis.console:
	docker-compose run redis.console

mongo.console:
	docker-compose run mongo.console

ps:
	docker-compose ps

stop:
	docker-compose stop

kill.all:
	docker ps -q | xargs docker kill

kill:
	docker-compose kill
