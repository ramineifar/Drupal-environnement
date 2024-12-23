up:
	docker-compose up -d

down:
	docker-compose down

restart:
	make down
	make up

build:
	docker-compose up -d --build

require:
	docker-compose exec php sh -c "composer require ${require}"

cr:
	docker-compose exec php sh -c "./vendor/bin/drush cr"

drush:
	docker-compose exec php sh -c "./vendor/bin/drush ${command}"

composer-install:
	docker-compose exec php sh -c "composer install"

install:
	make up
	make reset-all
	make composer-install

reinstall:
	make destroy
	make install

destroy:
	make down
	make reset-all
	make reset-logs

reset-bdd:
	sudo rm -rf ./docker/mariadb/datas/*
	sudo rm -rf ./docker/mariadb/datas/.my-healthcheck.cnf

reset-app:
	rm -rf ./project/composer.lock
	sudo rm -rf ./project/vendor/
	sudo rm -rf ./project/web/
	rm -f ./project/.editorconfig
	rm -f ./project/.gitattributes

reset-logs:
	sudo rm -rf logs/*

reset-all:
	make reset-bdd
	make reset-app
