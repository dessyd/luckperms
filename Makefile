.SILENT:
SHELL = bash

.env:
	echo "Create $@ from template"
	op inject -f -i tpl.env > $@ && chmod 600 $@

env: .env

up: env
	echo "Powering up"
	docker compose up -d

down:
	echo "Powering down"
	docker compose down

clean: env
	echo "Powering down and clean"
	docker compose down	-v
	rm -f .env