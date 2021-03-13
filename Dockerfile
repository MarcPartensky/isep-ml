FROM python:3.9.2

# COPY . /app
# WORKDIR /app
COPY . .

RUN pip install -r requirements.txt

# ENTRYPOINT ["flask", "run"]
# ENTRYPOINT ["gunicorn", "wsgi:app"]
