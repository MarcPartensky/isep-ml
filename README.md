# IALab
Chatbot API using [based on a pytorch tutorial](https://pytorch.org/tutorials/beginner/chatbot_tutorial.html) hosted on https://ialab.marcpartensky.com.


## Usage
```sh
http -f POST https://ialab.marcpartensky.com message=hi
```

## Deploy with docker
```sh
docker run marcpartensky/ialab
```

## Deploy yourself

### Dependencies
* python3.9.2

### Commands
```sh
git clone https://github.com/marcpartensky/ialab
cd ialab
pip install -r requirements.txt
flask run
```

## Train it yourself
The datasets is available on [google drive](https://drive.google.com/drive/u/0/folders/1ruRm_mrIazj9utK9SZuscpGTz9ORcBah).
