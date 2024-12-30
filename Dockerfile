FROM python:3.9-slim
LABEL maintainer="assinaturas.dalineecruz@gmail.com"

RUN apt-get update && apt-get upgrade
ADD https://github.com/badtuxx/giropops-senhas.git /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
ENV REDIS_HOST="meu_redis"
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
