FROM alpine:edge

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION=us-west-1

ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

RUN apk add --update --no-cache \
    python \
  && apk add --update --no-cache --virtual=build-dependencies \
    py-pip

RUN pip install awscli \
  && aws --version \
  && apk del --purge build-dependencies \
  && rm -fr /var/cache/apk/* \
    /tmp/*
