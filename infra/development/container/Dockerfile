FROM ruby:3.2.2

WORKDIR /usr/src/app

RUN apt update && apt install libnss3-dev libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev -y

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD [ "rails", "s", "-b", "0.0.0.0" ]
