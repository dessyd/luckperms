.SILENT:
SHELL = bash

.env:
	echo "Create $@ from template"
	op inject -f -i tpl.env > $@ && chmod 600 $@

env: .env

up: env
	echo "Powering $@"
	docker compose $@ -d

down:
	echo "Powering $@"
	docker compose $@

clean: 
	echo "Powering down and clean"
	docker compose down	-v
	rm -f .env