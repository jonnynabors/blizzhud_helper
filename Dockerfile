FROM alpine:latest

RUN apk add curl zip

COPY BlizzHUD* .