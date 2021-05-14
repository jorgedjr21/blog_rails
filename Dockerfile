FROM ruby:2.7.3-alpine

RUN apk add --no-cache --update \
  build-base \
  linux-headers \
  nodejs \
  yarn \
  mariadb-dev \
  tzdata \
  graphviz \
  gmp-dev

WORKDIR /blog_rails
COPY Gemfile /blog_rails/Gemfile
COPY Gemfile.lock /blog_rails/Gemfile.lock
RUN npm install --global yarn && bundle install && yarn install && bundle install


# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
