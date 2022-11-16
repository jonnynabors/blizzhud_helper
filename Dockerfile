FROM alpine:latest

RUN apk add curl zip jq

COPY upload_to_wow_interface.sh /usr/local/bin

# For testing purposes only, these are unused during actual build time
COPY libs libs/
COPY embeds.xml BlizzHUD* .