FROM tomcat:8.5.41-jre8

RUN apt-get install curl unzip

WORKDIR  /

RUN mkdir ovitmp && \
    cd ovitmp && \
    curl http://bkp.gotdns.com/oviyam.zip > oviyam.zip && \
        unzip oviyam.zip
        
RUN rm -R /usr/local/tomcat/webapps/ROOT/
RUN cp /ovitmp/Oviyam-2.7-bin/Oviyam-2.7-bin/oviyam2.war /usr/local/tomcat/webapps/oviyam2.war
RUN cp /ovitmp/Oviyam-2.7-bin/tomcat/*.jar  /usr/local/tomcat/lib
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
