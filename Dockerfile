FROM alpine:latest

RUN apk update && apk add curl unzip && \
    curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip && \
    mv xray /usr/bin/xray && \
    chmod +x /usr/bin/xray && \
    mkdir -p /etc/xray && \
    mv *.json /etc/xray/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
