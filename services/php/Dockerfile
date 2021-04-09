FROM centos:7
LABEL "PowerBy"="fatetoper"
RUN yum install -y gcc gcc-c++ gd-devel libxml2-devel libcurl-devel libjpeg-devel libpng-devel openssl-devel make perl
ADD libzip-1.2.0.tar.gz /tmp
RUN cd /tmp/libzip-1.2.0 && \
    ./configure && \
    make && \
    make install
ADD php-7.3.9.tar.gz /tmp
RUN cd /tmp/php-7.3.9 && \
    ./configure --prefix=/usr/local/php \
    --with-config-file-path=/usr/local/php/etc \
    --with-mysql --with-mysqli \
    --with-openssl --with-zlib --with-curl --with-gd \
    --with-jpeg-dir --with-png-dir --with-iconv \
    --enable-fpm --enable-zip --enable-mbstring && \
    cp /usr/local/lib/libzip/include/zipconf.h /usr/local/include/ && \
    make -j 4 && make install && \
    cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf && \
    cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf  && \
    sed -i "s/127.0.0.1/0.0.0.0/g" /usr/local/php/etc/php-fpm.d/www.conf && \
    cp ./sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm && \
    chmod +x /etc/init.d/php-fpm
#COPY php.ini /usr/local/php/etc
 
EXPOSE 9000
CMD /etc/init.d/php-fpm start  && tail -F /var/log/messages