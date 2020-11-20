FROM ruby:2.6.3

WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_13.x -o nodesource_setup.sh  && \
    bash nodesource_setup.sh && \
    apt install nodejs

COPY Gemfile Gemfile.lock ./

RUN bundle install --without debug

EXPOSE 4567
