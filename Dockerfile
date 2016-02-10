FROM alpine:edge

RUN apk add --update --no-cache \
    python \
  && apk add --update --no-cache --virtual=build-dependencies \
    py-pip

RUN pip install awscli \
  && aws --version \
  && apk del --purge build-dependencies \
  && rm -fr /var/cache/apk/* \
    /tmp/*
