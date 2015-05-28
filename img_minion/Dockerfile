FROM centos:6
MAINTAINER Ming Hsieh "zanhsieh@gmail.com"

# Fix cli `top` not work
ENV TERM dumb

# Install `which` to fix salt-minion `[ERROR] 'cmd.run_stdout'`
RUN yum -y install epel-release ;\
    yum -y install which nc wget curl dnsutils python-pip python-devel salt-minion;\
    mkdir -p /etc/salt/minion.d ; \
    echo 'master: master' > /etc/salt/minion.d/master.conf ;\
    chkconfig salt-minion on

VOLUME ["/etc/salt", "/var/cache/salt", "/var/logs/salt", "/srv/salt", "/srv/pillar", "/srv/reactor"]

CMD /sbin/init
