FROM openjdk:17-jdk-slim
COPY target/dockerfile-gen.jar  dockerfile-gen.jar
WORKDIR /user/app
ENTRYPOINT ["java","-jar","dockerfile-gen.jar"]
