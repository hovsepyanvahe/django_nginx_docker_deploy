FROM python:3.8-alpine

ENV PATH="/scripts:${PATH}"

COPY requirements.txt /requirements.txt
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers
RUN pip install -r /requirements.txt
RUN apk del .tmp

RUN mkdir django_docker_deploy
COPY django_docker_deploy/django_docker_deploy /django_docker_deploy
WORKDIR /django_docker_deploy