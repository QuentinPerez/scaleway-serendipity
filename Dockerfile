## -*- docker-image-name: "armbuild/ocs-app-serendipity:trusty" -*-
FROM armbuild/ocs-distrib-ubuntu:lts
MAINTAINER Online Labs <opensource@ocs.online.net> (@online_en)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter

# Install packages
RUN apt-get -q update &&  \
    apt-get -q upgrade && \
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
# - Add ocs-scripts
# - Tweaks rootfs so it matches Online Labs infrastructure
# RUN curl https://raw.githubusercontent.com/online-labs/ocs-scripts/master/upgrade_root.bash | bash
ADD ./patches/etc/ /etc/

# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
