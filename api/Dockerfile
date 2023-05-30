FROM python:3.10-alpine

RUN apk update
RUN pip install --no-cache-dir pipenv

WORKDIR /usr/src/app
COPY requirements.txt bootstrap.sh ./
COPY crop_predict ./crop_predict
COPY models ./models

pip install -r requirements.txt

EXPOSE 5000
ENTRYPOINT ["/usr/src/app/bootstrap.sh"]
