FROM python:3.9 as training
WORKDIR /root

RUN pip install pipenv

COPY data data
COPY Pipfile Pipfile.lock bot.py ./
RUN pipenv install
RUN pipenv run pip freeze  > ./requirements.txt

ENV TRAIN=yes
ENV PARSE=yes
ENV CHECKPOINTS=yes

# RUN pipenv run ./bot.py
ENTRYPOINT ["pipenv", "run", "./bot.py"]

FROM python:3.9 as web
WORKDIR /root

COPY --from=training /root/requirements.txt ./
# COPY --from=training data data/save
RUN pip install -r requirements.txt

COPY data data
COPY bot.py server.py ./
COPY templates templates
COPY static static

ENV HOST=0.0.0.0
ENV PORT=80
ENV FLASK_DEBUG=true

# ENTRYPOINT ["flask", "run"]
ENTRYPOINT ["gunicorn", "server:app"]
