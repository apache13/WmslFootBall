FROM ruby:latest

RUN apt-get update && apt-get install -y nodejs sqlite3 nano curl --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/WmslFootBall

COPY Gemfile* ./

RUN bundle install

COPY . .

ENV RAILS_ENV='production'

RUN rake db:create

RUN rake db:migrate

RUN rake db:seed

ENV RAILS_SERVE_STATIC_FILES=true

RUN rake assets:precompile

EXPOSE 3000

CMD ["rails", "server"]
