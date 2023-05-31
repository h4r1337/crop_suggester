FROM python:3.10.6-alpine

RUN apk update
RUN apk add gcc
RUN python3 -m pip install --upgrade pip
RUN pip install --no-cache-dir pipenv

WORKDIR /usr/src/app
COPY requirements.txt bootstrap.sh ./
COPY crop_predict ./crop_predict
COPY models ./models

RUN pip install -r requirements.txt

EXPOSE 5000
ENTRYPOINT ["/usr/src/app/bootstrap.sh"]
