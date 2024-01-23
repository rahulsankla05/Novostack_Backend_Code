run:

	python -m uvicorn src.indibook.adapters.entrypoints.application:app --host 0.0.0.0 --port 8001 --reload

start_db:
	pwd
	docker network inspect indibook_docker_net || docker network create indibook_docker_net
	docker-compose -f src/indibook/configurator/resources/postgres/docker-compose.yaml up -d

migrate:
	   psql -d "dbname='indibook' user='postgres' password='=Z>=!AxZay&C:V7J' host='ec2-13-232-64-3.ap-south-1.compute.amazonaws.com'" -f src/indibook/configurator/resources/postgres/db.sql

count:
	 find . -type f -name '*.py' | xargs cat | wc -l

count_all:
	 find . -type f \( -name '*.py' -o -name '*.yaml' -o -name '*.sql' \) | xargs cat | wc -l

docker_up:
	docker network inspect indibook_docker_net || docker network create indibook_docker_net
	docker compose up --build
