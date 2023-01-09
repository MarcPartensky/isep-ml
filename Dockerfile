FROM python:3.9.16 as training
WORKDIR /root

RUN pip install pipenv
RUN pipenv install
RUN pipenv run pip freeze  > requirements.txt

COPY Pipfile Pipfile.lock bot.py download.sh ./
RUN ./download.sh

ENV TRAIN=yes
ENV PARSE=yes
RUN pipenv run ./bot.py

FROM python:3.9.16-alpine as web
WORKDIR /root

COPY --from=training requirements.txt ./
COPY --from=training data data/save
COPY bot.py ./
COPY templates templates
COPY static static

RUN pip install -r requirements.txt

# ENTRYPOINT ["flask", "run"]
ENTRYPOINT ["gunicorn", "server:app"]
