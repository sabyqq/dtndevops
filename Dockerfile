FROM centos

LABEL maintainer="Moehammad Nauval Sabyq <saya@sabyq.my.id>"

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y && yum install nodejs nginx postgresql-server npm -y && yum clean all

RUN sed -i 's|80|8080|' /etc/nginx/nginx.conf && \
su postgres -c 'initdb /var/lib/pgsql/data' && \
echo 'host    all             all             0.0.0.0/0               trust' >> /var/lib/pgsql/data/pg_hba.conf && \
sed -i "s|#listen_addresses = 'localhost'|listen_addresses = '*'|" /var/lib/pgsql/data/postgresql.conf


RUN mkdir -p /opt/oss/{bin,data}/backups && \
mkdir /usr/share/oss

WORKDIR /usr/share/oss/

COPY bin/ /opt/oss/bin/

RUN chmod +x /opt/oss/bin/*

COPY app.js package.json entrypoint.sh /usr/share/oss/

RUN npm install

EXPOSE 80 8080 5432

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
