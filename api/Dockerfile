FROM python:3.10.6

RUN apt-get update
RUN apt-get install -y gcc
RUN python3 -m pip install --upgrade pip
RUN pip install --no-cache-dir pipenv

WORKDIR /usr/src/app
COPY Pipfile Pipfile.lock bootstrap.sh ./
COPY models ./models
COPY crop_predict ./crop_predict

RUN ls -alp /usr/src/app
RUN ls -alp /usr/src/app/models
RUN ls -alp /usr/src/app/crop_predict

RUN pipenv install --system --deploy

EXPOSE 5000
ENTRYPOINT ["/usr/src/app/bootstrap.sh"]
