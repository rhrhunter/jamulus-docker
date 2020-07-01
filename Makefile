
build:
	docker-compose build

up:
	docker-compose up -d

up-fg:
	docker-compose up

logs:
	docker-compose logs -f

stop:
	docker-compose down
	docker-compose kill
