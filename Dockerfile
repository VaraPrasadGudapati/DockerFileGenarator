FROM openjdk:17
COPY . .
WORKDIR /user/app
ENTRYPOINT ["java","-jar","Dockerfile_gen.jar"]
