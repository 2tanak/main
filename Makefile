bash:
	docker compose exec -it app_main bash
down:
	docker compose down
down_v:
	docker compose down --volumes --remove-orphans
up:
	docker compose up -d
build:
	docker compose build
start:	status
	 systemctl start supervisor
reload:
	 supervisorctl reload
restart:
	supervisorctl restart laravel-worker
start_all:
	supervisorctl start all
stop:
	systemctl stop supervisor
ps:
	ps ax | grep artisan
reload:
	systemctl reload supervisor
status:
	systemctl status supervisor
stop:_all:
	supervisorctl stop all
reread:	update
	supervisorctl reread
upadate:
	supervisorctl update
