#VERSION 0.0.1
FROM centos:latest
yum install openssh-server 
CMD mkdir -p /data/www/site_view
VOLUME ["/data/www/site_view/*", "/data/www/site_view/*"]
ENV JAVA_HOME /usr/local/jdk1.7.0_51/
EXPOSE 6557
EXPOSE 6558
WORKDIR /data/www/site_view/
CMD ["./restart_pagehar.sh"]
