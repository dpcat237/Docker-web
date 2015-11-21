FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

#PHP
RUN apt-get update && apt-get install -y php5 \
    php5-cli \
    php5-json \
    php5-intl \
    php5-curl \
    php5-mongo \
    php5-intl \
    php-apc \
    php5-imagick \
    php5-xdebug \
    php-soap \
    php5-mysql \
    phpunit \
    curl \
    mysql-client

#mongo shell
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-get update && apt-get install -y mongodb-org

#Server
RUN apt-get update && apt-get install -y nodejs \
    yui-compressor

#Other
RUN apt-get update && apt-get install -y wkhtmltopdf \
    build-essential \
    git \
    software-properties-common \
    nano \
    supervisor \
    htop

#RVM and Ruby
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -y ruby2.2
RUN gem2.2 install bundler
RUN gem2.2 install sass
RUN gem2.2 install capifony
RUN apt-get install -y ruby-compass

#Coffee
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN apt-get install -y nodejs npm
RUN npm install --global --verbose promised-io
RUN npm install -g coffee-script@1.6.3
RUN ln -s /usr/local/bin/coffee /usr/bin/coffee
RUN cd /usr/bin
RUN ln -s `which nodejs` node
RUN ln -s `which coffee` coffee
RUN ln -s `which compass` compass

#Apache
RUN apt-get update && apt-get install -y apache2
RUN rm -f /etc/apache2/sites-enabled/*

COPY Docker/copy/ /

ADD Docker/execute/start.sh /start.sh
ADD Docker/execute/symfony_environment.sh /etc/profile.d/symfony_environment.sh

#composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

#cron to update composer
ADD Docker/execute/start-cron.sh /usr/bin/start-cron.sh
RUN chmod +x /usr/bin/start-cron.sh
CMD /usr/bin/start-cron.sh

WORKDIR /var/www

ENTRYPOINT ["/start.sh"]
