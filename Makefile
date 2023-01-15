server:
	CHECKPOINTS=yes PORT=8000 FLASK_DEBUG=yes ./server.py
bot:
	CHECKPOINTS=yes ./bot.py
train:
	docker compose up --build -d train
download:
	./download.sh
update:
	pipenv update
	pipenv run pip freeze > requirements.txt
build: update
	docker-compose build
push: build
	docker-compose push
run: build
	docker-compose up -d ialab --force-recreate
