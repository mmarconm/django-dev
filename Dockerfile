# syntax=docker/dockerfile:1
FROM python:3.10-alpine

RUN pip3 install -U pip

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY ./requirements.txt /app/

RUN pip3 install -r /app/requirements.txt

# COPY ./app /app/