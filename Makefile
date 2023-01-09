server:
	./server.py
bot:
	./bot.py
train:
	PARSE=yes TRAIN=yes ./bot.py
	touch train
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
