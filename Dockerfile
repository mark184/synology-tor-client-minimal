FROM alpine:edge
RUN apk update
RUN apk upgrade
# Alpine Linux package testing : http://dl-4.alpinelinux.org/alpine/edge/testing/x86_64/
RUN apk add tor --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add nano

EXPOSE 9150

RUN rm /var/cache/apk/*

ADD ./torrc /etc/tor/torrc

USER tor
CMD /usr/bin/tor -f /etc/tor/torrc
