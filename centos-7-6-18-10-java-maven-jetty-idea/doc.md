# dockerイメージ作成
```
time docker build -t centos-7-6-18-10-java-maven-jetty-idea --build-arg CONTAINER_NAME=centos-7-6-18-10-java-maven-jetty-idea --build-arg OS_VERSION=$(echo centos-7-6-18-10-java-maven-jetty-idea | grep -Po '[a-z]{1,}(?:-[0-9]{1,}){1,}') . | tee log
```

# dockerコンテナ起動
```
docker run --privileged --shm-size=2gb -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /etc/localtime:/etc/localtime -v /run/udev:/run/udev -v /run/systemd:/run/systemd -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/lib/dbus:/var/lib/dbus -v /var/run/dbus:/var/run/dbus -v /etc/machine-id:/etc/machine-id -p 9999:9999 --name centos-7-6-18-10-java-maven-jetty-idea -itd centos-7-6-18-10-java-maven-jetty-idea
```

# dockerコンテナ潜入
```
docker exec -it centos-7-6-18-10-java-maven-jetty-idea /bin/bash
```

# dockerコンテナ削除

- ALL削除

```
docker ps -qa | xargs -I@ bash -c 'docker stop @ && docker rm @'
```

- Exit削除

```
docker ps -a | grep Exit | awk '{print $1}' | xargs -I@ bash -c 'docker stop @ && docker rm @'
```

- 単一削除

```
docker ps -a | grep -P $(pwd | sed 's;.*/;;') | awk '{print $1}' | xargs -I@ bash -c 'docker stop @ && docker rm @'
```

# dockerイメージ削除

- ALL削除

```
docker images | awk '$1=="<none>"{print $3}' | xargs -I@ docker rmi @
```