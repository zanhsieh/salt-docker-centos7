FROM centos:7
LABEL MAINTAINER "Ming Hsieh<zanhsieh@gmail.com>"

# Fix cli `top` not work
ENV TERM dumb
ENV container docker

RUN yum -y update; yum clean all
RUN yum -y install systemd; yum clean all; \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install `which` to fix salt-minion `[ERROR] 'cmd.run_stdout'`
RUN yum -y install epel-release ;\
    yum -y install which nc wget curl dnsutils python-pip python-devel salt-minion;\
    mkdir -p /etc/salt/minion.d ;\
    yum clean all ;\
    echo 'master: master' > /etc/salt/minion.d/master.conf ;\
    chkconfig salt-minion on

VOLUME ["/sys/fs/cgroup", "/etc/salt", "/var/cache/salt", "/var/logs/salt", "/srv/salt", "/srv/pillar", "/srv/reactor"]

CMD ["/usr/sbin/init"]
