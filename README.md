# dtndevops

Ini merupakan source code image docker untuk keperluan test interview posisi DevOps Engineer di PT Datasintesa Teknologi Nusantara

## Build Image
```shell
docker build . -t node
```

## Run image
```shell
docker run -d -p 80:80 -p 8080:8080 -p 5432:5432 --name node node
```

## Bin Start Stop Backup
start
```shell
docker exec -it node /opt/oss/bin/start
```

stop
```shell
docker exec -it node /opt/oss/bin/stop
```

backup
```shell
docker exec -it node /opt/oss/bin/backup
```
