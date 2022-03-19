# IALab
Chatbot API using [based on a pytorch tutorial](https://pytorch.org/tutorials/beginner/chatbot_tutorial.html) hosted on https://ialab.marcpartensky.com.

## Usage
![hi](https://cdn.discordapp.com/attachments/729992302575091718/820346968995266611/ialab.png)

### Using [httpie](https://httpie.io/)
```sh
http -f POST https://ialab.marcpartensky.com message="how are you"
# running locally
http -f POST localhost:8000 message="how are you"
```
### Using [curl](https://curl.se/)
```sh
curl -sX POST -F message="message how are you" https://ialab.marcpartensky.com
# running locally
curl -sX POST -F message="message how are you" localhost:8000
# using ask.sh
./ask.sh how are you
```
![how are you](https://cdn.discordapp.com/attachments/729992302575091718/820347299838033960/howareyou.png)

## Deploy with docker
```sh
docker run -p 8000:8000 marcpartensky/ialab
# or using docker-compose
docker-compose up -d
```

## Deploy yourself

### Dependencies
* python3.9.2

### Commands
```sh
git clone https://github.com/marcpartensky/ialab
cd ialab
pip install -r requirements.txt
# Run the web server
./server.py
# Or run only the bot as cli
./bot.py
```

## Train it yourself
The datasets is available on [google drive](https://drive.google.com/drive/u/0/folders/1ruRm_mrIazj9utK9SZuscpGTz9ORcBah).
