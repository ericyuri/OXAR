#!/bin/bash

#*** TOMCAT ***
yum install tomcat tomcat-webapps tomcat-admin-webapps -y

#Add a user into tomcat-users.xml (/etc/tomcat/tomcat-user.xml) as defined in config.properties
perl -i -p -e "s/<tomcat-users>/<tomcat-users>\n  <\!-- Auto generated content by http\:\/\/www.github.com\/OraOpenSource\/oraclexe-apex install scripts -->\n  <role rolename=\"manager-gui\"\/>\n  <user username=\"${OOS_TC_USERNAME}\" password=\"${OOS_TC_PWD}\" roles=\"manager-gui\"\/>\n  <\!-- End auto-generated content -->/g" /etc/tomcat/tomcat-users.xml

#Auto start tomcat
#tomcat service location: /usr/lib/systemd/system/tomcat.service
systemctl enable tomcat.service
