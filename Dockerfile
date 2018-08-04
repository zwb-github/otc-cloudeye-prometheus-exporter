FROM python:2.7-alpine

LABEL maintainer "tiago@reichert.eti.br"

COPY requirements.txt /app/

RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt

RUN apk update
RUN apk add --no-cache openssl

ADD ./binary/dockerize-alpine-linux-amd64-v0.6.1.tar.gz /tmp/dockerize-alpine-linux-amd64-v0.6.1.tar.gz
RUN mv /tmp/dockerize-alpine-linux-amd64-v0.6.1.tar.gz/dockerize /usr/local/bin/dockerize \
    && rmdir /tmp/dockerize-alpine-linux-amd64-v0.6.1.tar.gz

COPY ./app /app
COPY ./config /app/config

EXPOSE 8000

CMD dockerize -template /app/config/app_config.tmpl:/app/config/app_config.ini  -template /app/config/log_config.tmpl:/app/config/log_config.ini python /app/main.py
