FROM debian:stretch
ENV app /var/www
WORKDIR ${app}

RUN apt-get update && \
	apt-get -y install \
		ssh \
		wget \
		git \
		iputils-ping \
		cron \ 
		vim \ 
		apache2 \ 
		php \
		php-zip \
		php-mbstring \
		php-xml \
		php-pgsql \
		php-curl \
		php-gd \
		nfs-common && \
	apt-get -y autoremove && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	a2enmod ssl && \
	a2enmod rewrite && \
	a2enmod proxy && \
	a2enmod proxy_http && \
	a2enmod proxy_balancer && \
	a2enmod lbmethod_byrequests

RUN wget https://getcomposer.org/composer.phar && chmod u+x composer.phar && mv composer.phar /usr/local/bin/composer

