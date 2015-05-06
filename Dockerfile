## -*- docker-image-name: "onli/scw-app-serendipity:latest" -*-
FROM armbuild/scw-distrib-ubuntu:lts
MAINTAINER onli <onli@paskuda.biz> (@onliandone)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update &&  \
    apt-get -y -q upgrade && \
    apt-get install -y -q \
	php5              \
	php5-sqlite       \
	imagemagick       \
	unzip		  \
    && apt-get clean


# Install WordPress
RUN wget -O serendipity.zip http://sourceforge.net/projects/php-blog/files/latest/download && \
    unzip serendipity.zip && \
    rm -Rf /var/www/html && \
    mv serendipity /var/www/html && \
    rm -f serendipity.zip


# Patch rootfs
ADD ./patches/etc/ /etc/


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
