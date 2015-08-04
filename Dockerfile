# Using a compact OS
FROM centos:latest

MAINTAINER karl Zhai <karl.zhai@yunzhihui.com> 

VOLUME ["/data/www/site_view/", "/data/www/site_view/"]
#Java exporment
ENV JAVA_HOME /usr/local/jdk1.7.0_51/
EXPOSE 6557
EXPOSE 6558
