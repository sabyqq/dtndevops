FROM centos

LABEL maintainer="Moehammad Nauval Sabyq <saya@sabyq.my.id>"

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y && yum install nodejs nginx postgresql npm -y && yum clean all

RUN mkdir /opt/oss/ && \
mkdir /usr/share/oss/

WORKDIR /usr/share/oss/

COPY bin /opt/oss/
COPY app.js package.json /usr/share/oss/

RUN npm install

EXPOSE 80

ENTRYPOINT ["node", "app.js"]
