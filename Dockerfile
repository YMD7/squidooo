FROM ymd7/centos7-watir:latest

ENV APP_ROOT /usr/src/squidooo

WORKDIR $APP_ROOT

RUN \
  yum -y update && \
  yum -y install epel-release
RUN \
  yum -y install nodejs sqlite-devel && \
  yum -y install libjpeg-devel libpng-devel && \
  yum -y install ImageMagick ImageMagick-devel

COPY Gemfile      $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN \
  echo 'install: --no-document' >> ~/.gemrc && \
  echo 'update: --no-document' >> ~/.gemrc && \
  gem install nokogiri watir && \
  bundle config --global jobs 4 && \
  bundle install && \
  rbenv rehash

COPY . $APP_ROOT

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
