server:
	./server.py
bot:
	./bot.py
update:
	pipenv update
	pipenv lock -r > requirements.txt
build: update
	docker-compose build ialab
push: build
	docker-compose push ialab
run:
	docker-compose up -d ialab --force-recreate
