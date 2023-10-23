FROM openjdk:11
COPY target/dockerfilegen.jar /usr/app
WORKDIR /user/app
ENTRYPOINT ["java","-jar","dockerfilegen.jar"]
