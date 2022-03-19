server:
	./server.py
bot:
	./bot.py
update:
	pipenv update
	pipenv lock -r > requirements.txt
build: update
	docker build . -t marcpartensky/ialab
push: build
	docker push marcpartensky/ialab
