FROM alpine:latest

RUN apk add curl zip jq

# For testing purposes only, these are unused during actual build time
COPY libs libs/
COPY embeds.xml BlizzHUD* .