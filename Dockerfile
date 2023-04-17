FROM debian:stretch

RUN apt-get update
RUN apt-get install --yes \
      git-core \
      python \
      python-pip \
      python-virtualenv


# Install nginx.
COPY nginx.conf /etc/nginx/sites-enabled/nginx.conf
RUN set -x && \
    apt-get install --yes \
    nginx &&\
    rm /etc/nginx/sites-enabled/default 

# Create directory for app source code.
ARG APP_ROOT="/srv/demo-app"

WORKDIR "$APP_ROOT"

# Install demo app.
COPY . .

RUN  pip install --requirement requirements.txt

EXPOSE 5000

# Run demo app.

CMD set -x && \
    nginx &&\
    gunicorn \
      demo.app:app \
      --bind 127.0.0.1:5000 \
      --log-level info
