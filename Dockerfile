FROM openjdk:17-jdk-slim
WORKDIR /minecraft
RUN apt-get update && apt-get install -y wget
# Télécharge le serveur Fabric pour Minecraft 1.20.1
RUN wget -O fabric-server.jar https://meta.fabricmc.net/v2/versions/loader/1.20.1/0.15.7/1.0.1/server/jar
COPY server.properties .
COPY eula.txt .
COPY mods ./mods
EXPOSE 25565
CMD ["java", "-Xmx400M", "-Xms400M", "-jar", "fabric-server.jar", "nogui"]
