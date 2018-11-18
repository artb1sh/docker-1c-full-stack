FROM centos:latest
MAINTAINER artb1sh@yandex.ru

ENV LANG ru_RU.utf8

COPY hasp.sh /
COPY hasplm.ini /etc/hasplm/

RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8 \
    && yum -y install which glibc.i686 usbutils \
    && curl -o /tmp/hasp.rpm -SL "https://download.etersoft.ru/pub/Etersoft/HASP/last/CentOS/7/haspd-7.60-eter1centos.x86_64.rpm" \
    && curl -o /tmp/hasp-modules.rpm -SL "https://download.etersoft.ru/pub/Etersoft/HASP/last/CentOS/7/haspd-modules-7.60-eter1centos.x86_64.rpm" \
    && yum install -y /tmp/*.rpm && rm /tmp/*.rpm \
    && yum install -y python-setuptools \
    && rm -rf /tmp/* \
    && yum clean all \
    && easy_install supervisor && \
    echo "[supervisord]" > /etc/supervisord.conf && \
    echo "nodaemon=true" >> /etc/supervisord.conf && \
    echo "" >> /etc/supervisord.conf && \
    echo "[program:hasp]" >> /etc/supervisord.conf && \
    echo "command=/hasp.sh" >> /etc/supervisord.conf && \
    echo "" >> /etc/supervisord.conf && \
    chmod +x /hasp.sh

EXPOSE 475 1947

CMD ["/usr/bin/supervisord"]
