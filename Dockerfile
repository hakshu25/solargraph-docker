ARG RUBY_VERSION="2.7.3"

FROM ruby:$RUBY_VERSION-slim

ENV APP_ROOT /usr/src/app

RUN apt update \
  && apt install -y build-essential libsqlite3-dev

# Install gems
WORKDIR $APP_ROOT
COPY Gemfile Gemfile.lock rails.rb ./
RUN gem install bundler
RUN bundle install --jobs=4
RUN gem install solargraph yard

# Install gem documentation
RUN yard gems

# Install rails documentation
RUN solargraph bundle

# Solargraph server port
EXPOSE 7658

# Run Solargraph
CMD [ "solargraph", "socket", "--host=0.0.0.0", "--port=7658" ]
