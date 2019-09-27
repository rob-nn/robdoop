FROM robdoop:latest
CMD service ssh start && hdfs datanode
