FROM ruby:2.4-alpine3.4
MAINTAINER Michael Telford

RUN apk --update add --virtual \
      build_deps \
      build-base \
      ruby-dev \
      libc-dev \
      linux-headers \
      openssl-dev \
      postgresql-dev \
      libxml2-dev \
      libxslt-dev \
      bash \
      make \
      curl \
      curl-dev \
      jq

WORKDIR /web
COPY . /web

RUN bundle

CMD ["bundle", "exec", "rake", "serve"]
