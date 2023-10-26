FROM openjdk:17
COPY C:\Users\KNOT\Downloads\Dockerfile\Dockerfile\target\Dockerfile_gen  dockerfile-gen
WORKDIR /user/app
ENTRYPOINT ["java","-jar","Dockerfile_gen.jar"]
