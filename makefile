build:
	docker-compose build
up:
	docker-compose up -d
db-create:
	docker-compose run web rails db:create
db-migrate:
	docker-compose run web rails db:migrate
down:
	docker-compose down
todo_web:
	docker exec -it todo_web bash
todo_db:
	docker exec -it todo_db bash

