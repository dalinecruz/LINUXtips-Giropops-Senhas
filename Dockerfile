FROM cgr.dev/chainguard/python:latest-dev as dev
LABEL maintainer="assinaturas.dalineecruz@gmail.com"

ADD https://github.com/badtuxx/giropops-senhas.git /app
WORKDIR /app
RUN python -m venv venv
ENV PATH="/app/venv/bin":$PATH
RUN pip install --no-cache-dir -r requirements.txt

FROM cgr.dev/chainguard/python:latest
WORKDIR /app
COPY --from=dev /app/venv /app/venv
ENV PATH="/app/venv/bin:$PATH"
ENV REDIS_HOST="meu_redis"
EXPOSE 5000
ENTRYPOINT ["python", "app.py"]
CMD ["flask", "run", "--host=0.0.0.0"]
