help:
	@echo
	@echo "> Development Docker Compose console"
	@echo
	@echo "frontend                     - Starts frontend"
	@echo "frontend.console             - Frontend console"
	@echo "frontend.build               - Frontend build"

	@echo "backend                      - Starts backend"
	@echo "backend.console              - Starts backend console"
	@echo "backend.build                - Backend build"

	@echo "redis.console                - Redis console"
	@echo "mongo.console                - MongoDB console"

	@echo "ps                           - List of processes"
	@echo "stop                         - Stop all processes"
	@echo "kill                         - Kill current processes"
	@echo "kill.all                     - Kill all docker processes"

	@echo

frontend:
	docker-compose up frontend

frontend.build:
	docker-compose build frontend

frontend.console:
	docker-compose run --rm frontend bash

backend:
	docker-compose up backend

backend.build:
	docker-compose build backend

backend.console:
	docker-compose run --rm backend bash

redis.console:
	docker-compose run --rm redis.console

mongo.console:
	docker-compose run --rm mongo.console

elasticsearch:
	docker-compose up elasticsearch

ps:
	docker-compose ps

stop:
	docker-compose stop

kill.all:
	docker ps -q | xargs docker kill

kill:
	docker-compose kill
