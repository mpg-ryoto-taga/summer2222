FROM ruby:2.7.1-alpine3.11

ENV LANG C.UTF-8 \
    TZ Asia/Tokyo

ENV BUILD_PACKAGES="build-base" \
    DB_PACKAGES="sqlite-dev postgresql-dev" \
    RAILS_PACKAGES="tzdata nodejs imagemagick yarn gcompat" \
    FAVORITE_PACKAGES="less"

RUN apk update && \
    apk upgrade && \
    apk add -u yarn && \
    apk --update --no-cache add \
        ${BUILD_PACKAGES} \
        ${DB_PACKAGES} \
        ${RAILS_PACKAGES} \
        ${FAVORITE_PACKAGES}

WORKDIR /app

COPY Gemfile \
     Gemfile.lock \
     /app/

RUN bundle install --jobs=4
