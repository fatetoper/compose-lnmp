FROM centos:7
LABEL "PowerBy"="fatetoper"
RUN yum install -y gcc-c++ zlib-devel pcre-devel make
ADD nginx-1.16.0.tar.gz /tmp
RUN cd /tmp/nginx-1.16.0 && ./configure --prefix=/usr/local/nginx && make -j 2 && make install
RUN rm -f /usr/local/nginx/conf/nginx.conf
COPY nginx.conf /usr/local/nginx/conf
 
EXPOSE 80
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]