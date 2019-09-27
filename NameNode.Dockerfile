FROM robdoop:latest
RUN $HADOOP_HOME/bin/hdfs namenode -format rob_cluster
WORKDIR /root
COPY dfs.hosts /root
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
CMD service ssh start && hdfs namenode

