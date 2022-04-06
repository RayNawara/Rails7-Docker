FROM ruby:3.1.1-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  libffi-dev \
  postgresql-client \
  git \
  libvips-dev \
  sqlite3 \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem update --system
RUN gem install bundler:2.3.10

WORKDIR /usr/src/app

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
