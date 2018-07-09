FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends  && \
    apt-get install -y install gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal && \
    apt-get install -y tightvncserver && \
    mkdir /root/.vnc && \
    apt-get install -y ubuntu-desktop python-software-properties && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:mozillateam/ppa && \
    apt-get update && \
    apt-get install -y firefox-esr && \
    apt-get install -y icedtea-netx



ADD xstartup /root/.vnc/xstartup
ADD passwd /root/.vnc/passwd

RUN chmod 600 /root/.vnc/passwd

CMD /usr/bin/vncserver :1 -geometry 1280x800 -depth 24 && tail -f /root/.vnc/*:1.log

EXPOSE 5901
