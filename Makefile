start:
	docker-compose up -d

infra_log:
	docker logs mvg_infra

build_lambda:
	cd lambda && go build -o build/ */* && mv build/*_lambda ../infra/development/lambda/
	docker compose restart cloud
	docker compose run infra