FROM tomcat:latest

RUN apt-get install curl unzip

WORKDIR  /

RUN mkdir ovitmp && \
    cd ovitmp && \
    curl https://downloads.sourceforge.net/project/dcm4che/Oviyam/2.7/Oviyam-2.7-bin.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fdcm4che%2Ffiles%2FOviyam%2F2.7%2FOviyam-2.7-bin.zip%2Fdownload&ts=1579058163> oviyam.zip && \
        unzip oviyam.zip
        
RUN rm -R /usr/local/tomcat/webapps/ROOT/
RUN cp /ovitmp/Oviyam-2.7-bin/Oviyam-2.7-bin/oviyam2.war /usr/local/tomcat/webapps/oviyam2.war
RUN cp /ovitmp/Oviyam-2.7-bin/Oviyam-2.7-bin/oviyam3.war /usr/local/tomcat/webapps/oviyam3.war
RUN cp /ovitmp/Oviyam-2.7-bin/tomcat/*.jar  /usr/local/tomcat/lib
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
