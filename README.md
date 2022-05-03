# salt-docker-centos7
Easy Salt state testing with Docker
===========

This repo simplified / inspired by [Love Nyberg's work](https://github.com/jacksoncage/salt-docker) but ported to CentOS 7 and split master and minion. It serves the same purpose as the original one to quick bring up a salt stack to let you verify some concept.

Salt master will auto accept all minions. 

## Salt versions

 - Official 2015.5.0 within standard EPEL release

## Get it running

### MacOSX: Change Docker Desktop setting

```
vi ~/Library/Group Containers/group.com.docker/settings.json

...
"deprecatedCgroupv1": true,
...

```

### Salt cluster with docker compose

Using [docker compose](https://github.com/docker/compose) is simplier. Move `docker-compose.yml.example` to `docker-compose.yml` and run:

```
docker-compose up ＆
```

Use same approach `docker exec -it [master_container_id] bash` to jump into salt master container.

## Build

```
git clone https://github.com/zanhsieh/salt-docker-centos7.git
cd salt-docker-centos7/img_master
docker build -t ming/salt-master .
cd ../img_minion
docker build -t ming/salt-minion .
```

## Special thanks
- All people in this [thread](https://github.com/docker/for-mac/issues/6073)
- George Chung, for pointing out use /sbin/init as well as shadow minion_id and grains within /etc/salt.
- Mohamed Lrhazi, for tipping on `yum -y install which` for work around `[ERROR]'cmd.run_stdout'` in salt minion on docker issue. The origin post is [here](https://groups.google.com/forum/#!topic/salt-users/6i7Kwdd-xxU)
