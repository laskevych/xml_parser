up: docker-up
down: docker-dowm
init: docker-dowm docker-pull docker-build docker-up
run:
	docker-compose run --rm app-php-cli php parse_xml.php

docker-up:
	docker-compose up -d

docker-dowm:
	docker-compose down --remove-orphans

docker-build:
	docker-compose build

docker-pull:
	docker-compose pull

