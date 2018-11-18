FROM centos:latest
MAINTAINER artb1sh@yandex.ru

ENV SERVER_VERSION 8_3_14_1373
ENV PATH /opt/1C/v8.3/x86_64/:$PATH
RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8
ENV GOSU_VERSION 1.11

ADD rpm64_${SERVER_VERSION}.tar.gz /tmp

RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && rm -r /root/.gnupg/ \
    && chmod +x /usr/local/bin/gosu

RUN yum -y install vim xorg-x11-fonts-Type1 xorg-x11-fonts-truetype cabextract xorg-x11-font-utils fontconfig net-tools \
    && yum install -y /tmp/*.rpm && rm /tmp/*.rpm \
    && rm -rf /tmp/* \
    && mkdir -p /opt/1C/v8.3/x86_64/conf

COPY logcfg.xml /home/usr1cv8/.1cv8/1C/1cv8/conf
COPY docker-entrypoint.sh /
COPY logcfg.xml /home/usr1cv8/.1cv8/1C/1cv8/conf
RUN chmod +x /docker-entrypoint.sh

VOLUME /home/usr1cv8
VOLUME /var/log/1C
EXPOSE 1540-1541 1560-1591 475 1947

ENTRYPOINT ["/docker-entrypoint.sh"]
