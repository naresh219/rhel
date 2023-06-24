#!/bin/bash
clear

dnf install tigervnc-server

vncpasswd

firewall-cmd --permanent --zone=public --add-port=5901/tcp

firewall-cmd --permanent --zone=public --add-port=5902/tcp

firewall-cmd --permanent --zone=public --add0-port=5903/tcp

firewall-cmd --reload

vim /etc/tigervnc/vncserver.users

:1=root

vim /etc/tigervnc/vncserver-config-defaults

add - alwaysshared

systemctl start vncserver@:1.service

systemctl enable vncserver@:1.service

systemctl daemon-reload

reboot
