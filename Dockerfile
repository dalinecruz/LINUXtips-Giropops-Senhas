FROM cgr.dev/chainguard/python:latest-dev as dev
LABEL maintainer="assinaturas.dalineecruz@gmail.com"

USER root
RUN apk add --no-cache git
RUN mkdir -p /app && chmod -R 755 /app
WORKDIR /app

COPY giropops-senhas/requirements.txt .
RUN python -m venv venv
ENV PATH="/app/venv/bin":$PATH
RUN pip install --no-cache-dir -r requirements.txt

FROM cgr.dev/chainguard/python:latest
WORKDIR /app

COPY giropops-senhas/app.py .
COPY giropops-senhas/static static/
COPY giropops-senhas/templates templates/
COPY --from=dev /app/venv /app/venv

ENV PATH="/app/venv/bin:$PATH"
ENV REDIS_HOST="meu_redis"
EXPOSE 5000
ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
