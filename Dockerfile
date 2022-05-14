# This file is to be used to create an image for a container that will run the flask main.py

FROM python:stretch

COPY . /main
WORKDIR /main

RUN pip install --upgrade pip
RUN pip install flask
RUN pip install gunicorn
RUN pip install pytest
RUN pip install pyjwt==1.7.1

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
