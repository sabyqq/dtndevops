# dtndevops

Ini merupakan source code image docker untuk keperluan test interview posisi DevOps Engineer di PT Datasintesa Teknologi Nusantara

## Build Image
Build image manual
```shell
docker build . -t node

```
atau pull image dari docker registry
```shell
docker pull sabyq/dtndevops:latest
```

## Run image
```shell
docker run -d -p 80:80 -p 8080:8080 -p 5432:5432 --name node node
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
psql -h localhost:5432
```

## Bin Start Stop Backup
start | Menjalankan seluruh services (nginx, express dan postgresql)
```shell
docker exec -it node /opt/oss/bin/start
```

stop | Menghentikan seluruh services (nginx, express dan postgresql)
```shell
docker exec -it node /opt/oss/bin/stop
```

backup | Melakukan backup database postgresql dengan ke /opt/oss/data/backups/db.sql
```shell
docker exec -it node /opt/oss/bin/backup
```
