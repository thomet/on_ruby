FROM ruby:2.1.5

ENV DEBIAN_FRONTEND noninteractive

# Install packages for building ruby
RUN apt-get update
RUN apt-get install -y --force-yes nodejs
RUN apt-get clean

# Setup ENV
ENV CONFIGURE_OPTS --disable-install-doc

# Setup application
VOLUME ["/var/www"]

WORKDIR /var/www

ADD Gemfile /var/www/Gemfile
ADD Gemfile.lock /var/www/Gemfile.lock

RUN bundle install --without=production
