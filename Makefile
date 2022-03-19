server:
	./server.py
bot:
	./bot.py
update:
	pipenv update
	pipenv lock -r > requirements.txt
build:
	docker build . -t marcpartensky/ialab
push: build
	docker push marcpartensky/ialab
