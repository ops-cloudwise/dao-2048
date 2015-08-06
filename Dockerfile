#Version 0.0.1
FROM centos:latest
RUN yum install wget gcc automake autoconf libtool make gcc-c++ -y
WORKDIR /opt/
# JAVA INSTALL
RUN wget -c http://118.186.220.66:8002/jdk-7u51-linux-x64.gz
RUN tar zxf jdk-7u51-linux-x64.gz -C /usr/local/
RUN sed -i 's@jdk.certpath.disabledAlgorithms=MD2, RSA keySize < 1024@#jdk.certpath.disabledAlgorithms=MD2, RSA keySize < 1024@g' /usr/local/jdk1.7.0_51/jre/lib/security/java.security
RUN ls /usr/bin/java*  | xargs -n 1 -t rm -rf
RUN ln -s /usr/local/jdk1.7.0_51/bin/java /usr/bin/java
RUN ln -s /usr/local/jdk1.7.0_51/bin/javac /usr/bin/javac
RUN ln -s /usr/local/jdk1.7.0_51/bin/javadoc /usr/bin/javadoc
RUN ln -s /usr/local/jdk1.7.0_51/bin/javaws /usr/bin/javaws
RUN echo "export JAVA_HOME=/usr/local/jdk1.7.0_51/" >> /root/.bashrc
RUN echo "export PATH=$JAVA_HOME/bin:$PATH" >> /root/.bashrc
RUN echo "export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /root/.bashrc
RUN source /root/.bashrc
RUN echo "export JAVA_HOME=/usr/local/jdk1.7.0_51/" >> /etc/rc.local
VOLUME ["/data/www/site_view/"]
#YSLOW INSTALL
RUN wget -c http://118.186.220.66:8002/node-v0.10.4.tar.gz
RUN tar zxf node-v0.10.4.tar.gz
RUN cd /opt/node-v0.10.4 && ./configure && make && make install
RUN npm config set registry http://registry.cnpmjs.org
RUN npm install yslow -g >/dev/null 2 >&1
VOLUME ["/usr/local/lib/node_modules/"]
RUN ln -s /usr/local/lib/node_modules/yslow/bin/yslow /usr/sbin/
RUN ln -s /usr/local/lib/node_modules/yslow/bin/yslow /usr/bin/
RUN yslow -V
EXPOSE 6557
EXPOSE 6558
RUN rm -f jdk-7u51-linux-x64.gz
CMD ["./restart_pagehar.sh"]
