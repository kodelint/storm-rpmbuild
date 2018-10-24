# default build is for CentOS7, change the base image to fit your build.
FROM centos:centos7
MAINTAINER Kodelint "kodelint@gmail.com"

RUN yum install -y wget make rpmdevtools

ADD Makefile storm-logviewer.service storm-nimbus.service storm-supervisor.service storm-ui.service storm.logrotate storm.spec storm.sysconfig storm.yaml storm_env.ini /repo/

RUN mkdir /repo/RPMS

WORKDIR /repo

VOLUME ["/repo/x86_64/"]

CMD make ; ls -l /repo/x86_64/
