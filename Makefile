build:
	@docker build . -t notes

run:
	@docker run --rm -p 8888:8080 notes

start: build run

up:
	@docker compose up

down:
	@docker compose down
	@docker compose rm