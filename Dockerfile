FROM ruby:2.7-alpine

RUN apk add --no-cache --update \
  build-base \
  linux-headers \
  nodejs \
  yarn \
  mariadb-dev \
  tzdata \
  graphviz \
  gmp-dev

RUN mkdir /blog_rails
WORKDIR /blog_rails
COPY Gemfile /blog_rails/Gemfile
COPY Gemfile.lock /blog_rails/Gemfile.lock
RUN bundle install
COPY . /blog_rails

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
