#VERSION 0.0.1
FROM centos:latest
VOLUME ["/data/www/site_view/", "/data/www/site_view/"]
ENV JAVA_HOME /usr/local/jdk1.7.0_51/
WORKDIR /data/www/site_view/
CMD ["./restart_pagehar.sh"]
EXPOSE 6557
EXPOSE 6558

