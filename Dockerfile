FROM tomcat:8.0.20-jre8
### Testing Dockerfile with irecharge assesment.
COPY target/*.war /usr/local/tomcat/webapps/wfapp.war
