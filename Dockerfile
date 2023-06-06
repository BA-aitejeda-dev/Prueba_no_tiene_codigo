FROM openjdk:17-jdk-alpine as Maven-builder

COPY ./.mvn ./.mvn
COPY ./mvnw .
COPY ./pom.xml .
COPY ./src ./src

RUN chmod +x mvnw

RUN ./mvnw dependency:go-offline
RUN ./mvnw package
# COPY ./target/./demo-0.0.1-SNAPSHOT.jar .

#PUERTO DE EXPOSICIÓN(FALTA CONFIGURACIÓN INTERNA DE LA IMAGEN)
EXPOSE 8001

#EJECUCIÓN INICIAL DEL EJECUTABLE (PARA LEVANTAR EL MICROSERVICIO)
ENTRYPOINT ["java","-jar","/target/demo-0.0.1-SNAPSHOT.jar"]