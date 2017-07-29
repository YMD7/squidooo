FROM ymd7/centos7-ruby:2.4.1

ENV APP_ROOT /usr/src/watir

WORKDIR $APP_ROOT

RUN yum -y update
RUN yum -y install wget

RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xf phantomjs-2.1.1-linux-x86_64.tar.bz2

RUN mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/
RUN rm -rf phantomjs-2.1.1-linux-x86_64*

RUN ldd /usr/local/bin/phantomjs
RUN yum -y install fontconfig-devel
RUN phantomjs -v

RUN gem install -f watir
RUN gem install -f nokogiri
