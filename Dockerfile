FROM python:3.9-slim
LABEL maintainer="dalineecruz@gmail.com"

RUN apt-get update && apt-get upgrade
ADD https://github.com/badtuxx/giropops-senhas.git /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt


