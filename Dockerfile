FROM ruby:latest

RUN apt-get update && apt-get install -y nodejs sqlite3 nano curl --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/WmslFootBall

COPY Gemfile* ./

RUN bundle install

COPY . .

ENV RAILS_ENV='production'

ARG RAILS_MASTER_KEY

ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}

RUN rake db:create

RUN rake db:migrate

ARG SEED

RUN rake ${SEED}

ENV RAILS_SERVE_STATIC_FILES=true

RUN rake assets:precompile

EXPOSE 3000

CMD ["rails", "server"]
