# FROM python:3
# ENV PYTHONUNBUFFERED=1
# RUN mkdir /asimplecrudproject
# WORKDIR /asimplecrudproject
# COPY requirements.txt /asimplecrudproject/
# RUN pip install -r requirements.txt
# COPY . /asimplecrudproject/


# pull official base image
FROM python:3

# set environment variables
ENV PYTHONDONTWRITEBYTEasimplecrudproject 1
ENV PYTHONUNBUFFERED 1
RUN mkdir /asimplecrudproject
WORKDIR /asimplecrudproject
# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install --upgrade pip
COPY requirements.txt /asimplecrudproject/

RUN pip install -r requirements.txt

# copy project
COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]




# Build the new image and spin up the two containers:
# $ docker-compose up -d --build
# Run the migrations:
# $ docker-compose exec web python manage.py migrate --noinput
# Ensure the default Django tables were created:
# $ docker-compose exec db psql --username=hello_django --dbname=hello_django_dev