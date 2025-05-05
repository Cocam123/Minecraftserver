FROM openjdk:17-jdk-slim
WORKDIR /minecraft
RUN apt-get update && apt-get install -y wget
# Fabric 1.20.1, loader 0.15.11
RUN wget -O fabric-server.jar https://meta.fabricmc.net/v2/versions/loader/1.20.1/0.15.11/1.0.1/server/jar
COPY server.properties .
COPY eula.txt .
EXPOSE 25565
CMD ["java", "-Xmx300M", "-Xms300M", "-jar", "fabric-server.jar", "nogui"]
