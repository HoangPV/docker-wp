FROM markoshust/magento-php:7.4-fpm-5
USER root
RUN apt-get install git-flow
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install git-lfs
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chmod a+x /usr/local/bin/wp
USER app
WORKDIR /var/www/html/
RUN mkdir -p src/web/app/themes
RUN mkdir -p src/web/app/plugins
WORKDIR /var/www/html/src
COPY gitconfig /var/www/.gitconfig


