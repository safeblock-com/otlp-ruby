# Dockerfile development version
FROM ruby:3.2.0

# Install yarn
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
# RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

# Default directory
# ENV INSTALL_PATH /opt/app
# RUN mkdir -p $INSTALL_PATH

# Install gems
WORKDIR /app
RUN gem install rails bundler
RUN bundle install

COPY . /app

# =console rails server -p 8080
ARG OTEL_TRACES_EXPORTER

EXPOSE 8080

# Start server
CMD ["bundle", "exec", "rails", "server", "-p", "8080"]
