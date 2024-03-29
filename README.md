# ISEP ML

## Usage
![hi](https://cdn.discordapp.com/attachments/729992302575091718/820346968995266611/ialab.png)

![how are you](https://cdn.discordapp.com/attachments/729992302575091718/820347299838033960/howareyou.png)

### Using [httpie](https://httpie.io/)
```sh
http -f POST https://ml.marcpartensky.com message="how are you"
# running locally after cloning the repo
http -f POST localhost:8000 message="how are you"
```
### Using [curl](https://curl.se/)
```sh
curl -sX POST -F message="message how are you" https://ml.marcpartensky.com
# running locally after cloning
curl -sX POST -F message="message how are you" localhost:8000
# using ask.sh after cloning
./ask.sh how are you
```

### Or using simply the CLI without webserver
```sh
# using bot.py after cloning
./bot.py
```

## Deploy with docker
```sh
docker run -p 8000:80 marcpartensky/isep-ml
# or using docker-compose after cloning
docker-compose up -d
```

## Deploy yourself

### Dependencies
* python3.9.2

### Commands
```sh
git clone https://github.com/marcpartensky/isep-ml
cd ialab
pip install -r requirements.txt
# Run the web server
./server.py
# Or run only the bot as cli
./bot.py
```
