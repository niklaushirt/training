# Pull base image 
FROM tomcat:8-jre8 

# Maintainer 
MAINTAINER "youremailaddress" 

# Run command
RUN apt-get update && apt-get -y upgrade

# Set variables
ENV myName John Doe

# Copy to images tomcat path 
#ADD web.xml /usr/local/tomcat/conf/ 
ADD yourwarfile.war /usr/local/tomcat/webapps/ 

# Expose the port of the web application
EXPOSE 8080

# Run server
CMD ["catalina.sh", "run"]

