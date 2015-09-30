## -*- docker-image-name: "scaleway/scaleway-serendipity:latest" -*-
FROM scaleway/ubuntu:trusty
MAINTAINER onli <onli@paskuda.biz> (@onliandone)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update &&      \
    apt-get -y -q upgrade &&  \
    apt-get install -y -q     \
	php5                  \
	php5-sqlite           \
	imagemagick           \
	unzip		      \
    && apt-get clean


# Install WordPress
ENV S9Y_VERSION 2.0.1
RUN wget -O serendipity.zip http://sourceforge.net/projects/php-blog/files/serendipity/${S9Y_VERSION}/serendipity-${S9Y_VERSION}.zip/download && \
    unzip serendipity.zip && \
    rm -Rf /var/www/html && \
    mv serendipity /var/www/html && \
    rm -f serendipity.zip


# Patch rootfs
ADD ./patches/etc/ /etc/


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
