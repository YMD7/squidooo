FROM ymd7/centos7-watir:latest

ENV APP_ROOT /usr/src/squidooo

WORKDIR $APP_ROOT

RUN \
  yum -y update && \
  yum -y install epel-release

###
#  CentOS 7.4 がリリースされるまでの
#  nodejs に必要な http-parser の問題回避
###
RUN \
  rpm -ivh https://kojipkgs.fedoraproject.org//packages/http-parser/2.7.1/3.el7/x86_64/http-parser-2.7.1-3.el7.x86_64.rpm

###
#  Add RPM package repository for Yarn
###
RUN \
  wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo

RUN \
  yum -y install nodejs sqlite-devel && \
  yum -y install yarn && \
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

EXPOSE 4000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "4000"]
