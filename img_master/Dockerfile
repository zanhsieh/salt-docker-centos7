FROM centos:6
MAINTAINER Ming Hsieh "zanhsieh@gmail.com"

# Fix cli `top` not work
ENV TERM dumb

# Install `which` to fix salt-minion `[ERROR] 'cmd.run_stdout'` 
RUN yum -y install epel-release ;\
    yum -y install which nc wget curl dnsutils python-pip python-devel salt-master ;\
    mkdir -p /etc/salt/master.d ; \
    echo 'interface: 0.0.0.0' > /etc/salt/master.d/master.conf ;\
    echo 'auto_accept: True' >> /etc/salt/master.d/master.conf ;\
    chkconfig salt-master on

VOLUME ["/etc/salt", "/var/cache/salt", "/var/logs/salt", "/srv/salt", "/srv/pillar", "/srv/reactor"]

EXPOSE 4505 4506

CMD /sbin/init
