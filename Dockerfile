FROM python:3.10-slim

ENV PYTHONUNBUFFERED True

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY . ./

RUN pip3 install --no-cache-dir -r requirements.txt

RUN sudo apt-get install libmysqlclient-dev

EXPOSE 8080

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
