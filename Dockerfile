FROM python:3.9.2

WORKDIR /app
COPY . .

RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "server:app"]
