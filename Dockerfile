FROM python:3.13-alpine

WORKDIR /app

COPY app/ /app/app/

RUN addgroup -S student && adduser -S student -G student && chown -R student:student /app

USER student

EXPOSE 8080

CMD ["python", "-m", "app.app"]
