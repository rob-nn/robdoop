#!/bin/bash
docker build -t robdoop .
docker build -t robdoop-namenode -f NameNode.Dockerfile .
docker build -t robdoop-datanode -f DataNode.Dockerfile .
