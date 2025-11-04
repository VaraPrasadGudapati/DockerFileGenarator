FROM eclipse-temurin:17-jre
COPY target/dockerfile-gen.jar  dockerfile-gen.jar
WORKDIR /user/app
ENTRYPOINT ["java","-jar","dockerfile-gen.jar"]
