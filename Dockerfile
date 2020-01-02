FROM python:3

RUN mkdir /app
WORKDIR /app
ADD ./app /app

ENV PYTHONUNBUFFERED 1
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
        tzdata \
        python3-setuptools \
        python3-pip \
        python3-dev \
        python3-venv \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip 

RUN pip install psycopg2-binary
RUN pip install psycopg2

COPY ./requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt