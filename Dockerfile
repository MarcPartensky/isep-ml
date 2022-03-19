FROM python:3.9

WORKDIR /app
COPY . .

RUN pip install -r requirements.txt

ENV HOST 0.0.0.0
ENV PORT 8000
ENTRYPOINT ["gunicorn", "--bind", "$HOST:$PORT", "server:app"]
