FROM openjdk:17
COPY C:\Users\KNOT\Downloads\Dockerfile\Dockerfile\target\dockerfile-gen.jar  dockerfile-gen.jar
WORKDIR /user/app
ENTRYPOINT ["java","-jar","dockerfile-gen.jar"]
