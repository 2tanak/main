bash:
	docker compose exec -it app_main bash
reload:
	systemctl reload supervisor
status:
	systemctl status supervisor
down:
	docker compose down
up:
	docker compose up -d
build:
	docker compose build
start:
	 systemctl start supervisor
stop:
	systemctl stop supervisor
ps:
	ps ax | grep artisan
rerate:	start	update	addworker	status
	supervisorctl reread
update:
	supervisorctl update
addworker:
	supervisorctl start laravel-worker

