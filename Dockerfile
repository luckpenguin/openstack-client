# image name lzh/openstack-client
FROM luckpenguin/openstackbase:kilo

MAINTAINER Zuhui Liu penguin_tux@live.com

ENV BASE_VERSION 2015-07-31


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install python-dev gcc python-setuptools libffi-dev libssl-dev -y
RUN apt-get clean

RUN env --unset=DEBIAN_FRONTEND

RUN mkdir /root/.pip
ADD pip.conf /root/.pip/pip.conf

RUN easy_install -i http://mirrors.aliyun.com/pypi/simple/ pip

RUN pip install python-openstackclient \
        -i http://mirrors.aliyun.com/pypi/simple/ \
        --trusted-host mirrors.aliyun.com

RUN pip install python-designateclient \
        -i http://mirrors.aliyun.com/pypi/simple/ \
        --trusted-host mirrors.aliyun.com

CMD ["/usr/bin/supervisord", "-n"]