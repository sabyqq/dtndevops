# dtndevops

Ini merupakan source code image docker untuk keperluan test interview posisi DevOps Engineer di PT Datasintesa Teknologi Nusantara

## Build Image
Build image manual
```shell
docker build . -t dtndevops

```
atau pull image dari docker registry
```shell
docker pull sabyq/dtndevops:latest
```

## Run image
```shell
docker run -d -p 80:80 -p 8080:8080 -p 5432:5432 --name dtn dtndevops
```

## Pengujian services berjalan
### Nginx
```shell
curl localhost:8080
```
### Node.JS / Express
```shell
curl localhost
```
### Database Postgresql
Pastikan user menggunakan postgres
```shell
su postgres
```
Lalu akses database menggunakan perintah berikut
```shell
psql -h localhost
```

## Bin Start Stop Backup
start | Menjalankan seluruh services (nginx, express dan postgresql)
```shell
docker exec -it dtn /opt/oss/bin/start
```

stop | Menghentikan seluruh services (nginx, express dan postgresql)
```shell
docker exec -it dtn /opt/oss/bin/stop
```

backup | Melakukan backup database ke /opt/oss/data/backups/db.sql
```shell
docker exec -it dtn /opt/oss/bin/backup
```
