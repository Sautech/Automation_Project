#!/bin/bash

sudo apt update -y
sudo apt install apache2 -y
sudo systemctl status apache2
sudo systemctl start apache2
timestamp=$(date '+%d%m%Y-%H%M%S')
myname=Saurabh
 tar -zcvf /tmp/${myname}-httpd-logs-${timestamp}.tar  /var/log/apache2/access.log /var/log/apache2/error.log
 sudo apt install awscli
s3_bucket=upgrad-saurabh
 aws s3 \
	 cp /tmp/${myname}-httpd-logs-${timestamp}.tar \
	 s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar

