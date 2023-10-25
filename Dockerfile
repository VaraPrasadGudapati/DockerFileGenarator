FROM openjdk:17
COPY target/Dockerfile_gen.jar /usr/app
WORKDIR /user/app
ENTRYPOINT ["java","-jar","Dockerfile_gen.jar"]
