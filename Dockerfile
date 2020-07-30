


FROM python:3.7.6
MAINTAINER VeereshElango, https:veereshelango.github.io
ENV DEBIAN_FRONTEND noninteractive
EXPOSE 5000

RUN apt-get update && apt-get -y install \
    python3-pip \
    libsm6 libxrender1 libfontconfig1 libxext6 \
 && apt-get clean \
 && apt-get autoremove \
 && rm -rf /var/lib/apt/lists/*
COPY ./flask_application/requirements_prod.txt /usr/app/requirements_prod.txt
WORKDIR /usr/app/
RUN pip3 install -r requirements_prod.txt
COPY ./flask_application /usr/app/flask_application
COPY ./face_detection_model /usr/app/face_detection_model
COPY ./output /usr/app/output
WORKDIR /usr/app/flask_application
RUN pip3 install -r requirements_prod.txt
RUN chown -R www-data:www-data /usr/app/
RUN find /usr/app/ -type d -exec chmod 2750 {} \+
RUN find /usr/app/ -type f -exec chmod 640 {} \+
CMD gunicorn --log-file=out.logs --bind 0.0.0.0:${PORT:-5000} wsgi
