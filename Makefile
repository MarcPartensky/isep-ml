server:
	./server.py
bot:
	./bot.py
train:
	docker compose build train
download:
	./download.sh
update:
	pipenv update
	pipenv lock -r > requirements.txt
build: update
	docker-compose build ialab
push: build
	docker-compose push ialab
run: build
	docker-compose up -d ialab --force-recreate
