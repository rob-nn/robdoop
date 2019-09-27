from ubuntu:18.04
RUN apt-get update && apt-get install -y ssh pdsh
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
RUN apt-get install -y curl
WORKDIR /opt
RUN curl https://www-eu.apache.org/dist/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz --output hadoop-3.2.1.tar.gz
RUN tar xfz hadoop-3.2.1.tar.gz
ENV HADOOP_HOME /opt/hadoop-3.2.1
ENV PATH $HADOOP_HOME/bin:$PATH
RUN apt-get install -y iproute2
COPY core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
RUN mkdir /root/.ssh
COPY id_rsa /root/.ssh
COPY id_rsa.pub /root/.ssh
COPY hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh
COPY authorized_keys /root/.ssh
COPY hadoop-functions.sh /$HADOOP_HOME/libexec/hadoop-functions.sh

ENV HDFS_NAMENODE_USER root
ENV HDFS_DATANODE_USER root
ENV HDFS_SECONDARYNAMENODE_USER root
ENV YARN_RESOURCEMANAGER_USER root
ENV YARN_NODEMANAGER_USER root
