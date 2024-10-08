# Stage1 -Build
FROM maven as maven
RUN mkdir usr/src/mymaven
WORKDIR usr/src/mymaven
COPY . .
RUN mvn  install -Dskiptests

# Stage 2-Deploy
FROM tomcat
WORKDIR webapps
COPY --from=maven /usr/src/mymaven/target/java-tomcat-maven-example.war .
RUN rm -rf ROOT && mv java-tomcat-maven-example.war ROOT.war