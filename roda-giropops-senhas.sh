#!/bin/bash

# Nome da rede
NETWORK_NAME=minha_rede

# Nome dos contêineres
REDIS_CONTAINER_NAME=meu_redis
APP_CONTAINER_NAME=giropops-senhas2

# Criar a rede Docker, se não existir
docker network inspect $NETWORK_NAME >/dev/null 2>&1 || \
docker network create $NETWORK_NAME

# Subir o contêiner Redis
docker run -d \
  --name $REDIS_CONTAINER_NAME \
  --network $NETWORK_NAME \
  redis:alpine

# Subir o contêiner da aplicação
docker build -t desafio-2:0.2 .
docker run -d \
  --name $APP_CONTAINER_NAME \
  --network $NETWORK_NAME \
  -p 5000:5000 \
  desafio-2:0.2
