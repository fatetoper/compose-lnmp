FROM centos:7
LABEL "PowerBy"="fatetoper"
RUN yum install -y gcc-c++ zlib-devel pcre-devel make wget perl openssl openssl-devel
ADD nginx-1.16.1.tar.gz /tmp
RUN cd /tmp/nginx-1.16.1 && \
    ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module && \
    make -j 2 && \
    make install && \
    rm -f /usr/local/nginx/conf/nginx.conf
COPY nginx.conf /usr/local/nginx/conf
EXPOSE 80
EXPOSE 443
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
