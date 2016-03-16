FROM alpine:edge

ENV AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_DEFAULT_REGION BUCKET

RUN apk add --update --no-cache \
    python \
  && apk add --update --no-cache --virtual=build-dependencies \
    py-pip

RUN pip install awscli \
  && aws --version \
  && apk del --purge build-dependencies \
  && rm -fr /var/cache/apk/* \
    /tmp/*

WORKDIR /workspace

VOLUME /workspace
