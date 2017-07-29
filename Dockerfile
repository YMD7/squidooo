FROM ymd7/centos7-ruby:2.4.1

ENV APP_ROOT /usr/src/app

WORKDIR $APP_ROOT

RUN \
  yum -y update && yum -y install wget
RUN \
  wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
  tar xf phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN \
  mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/ && \
  rm -rf phantomjs-2.1.1-linux-x86_64*
RUN \
  yum -y install fontconfig-devel && phantomjs -v

RUN \
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
CMD ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]
