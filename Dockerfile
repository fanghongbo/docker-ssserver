FROM docker.io/centos
MAINTAINER fanghongbo

# 1. 安装基本依赖
RUN yum install epel-release -y \
    && yum update -y \
    && yum -y install python2-pip 

# 2. 安装shadowsocks
RUN pip install shadowsocks

# 3. 数据持久化
VOLUME /data

# 4. 准备文件
ENV SS_PASS=password
COPY ss.conf /etc/ss.conf
COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod u+x /bin/docker-entrypoint.sh

# 5、启动命令
WORKDIR /data
EXPOSE 22090
CMD ["-c","/etc/ss.conf"]
ENTRYPOINT ["docker-entrypoint.sh"]
