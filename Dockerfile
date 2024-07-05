# pull base image
FROM python:3.10.4-slim-bullseye

# set environment variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set working dir
WORKDIR /code

RUN mkdir whl

# install dependencies
COPY ./whl/typing_extensions-4.12.2-py3-none-any.whl ./whl
COPY ./whl/asgiref-3.8.1-py3-none-any.whl ./whl
COPY ./whl/sqlparse-0.5.0-py3-none-any.whl ./whl
COPY ./whl/tzdata-2024.1-py2.py3-none-any.whl ./whl
COPY ./whl/Django-5.0.6-py3-none-any.whl ./whl
COPY ./whl/psycopg2_binary-2.9.9-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl ./whl
RUN pip install ./whl/typing_extensions-4.12.2-py3-none-any.whl
RUN pip install ./whl/asgiref-3.8.1-py3-none-any.whl
RUN pip install ./whl/sqlparse-0.5.0-py3-none-any.whl
RUN pip install ./whl/tzdata-2024.1-py2.py3-none-any.whl
RUN pip install ./whl/Django-5.0.6-py3-none-any.whl
RUN pip install ./whl/psycopg2_binary-2.9.9-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
RUN pip freeze > requirements.txt

# copy project
COPY . .