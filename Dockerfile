FROM adoptopenjdk/openjdk8:alpine-slim
EXPOSE 8761
#COPY $path /
ADD ./target/Servicio-Eureka-0.0.1-SNAPSHOT.jar  servicio-eureka.jar 
ENTRYPOINT ["java", "-jar", "/servicio-eureka.jar"]
