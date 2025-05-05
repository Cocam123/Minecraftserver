FROM openjdk:17-jdk-slim
WORKDIR /minecraft
RUN apt-get update && apt-get install -y wget
RUN wget -O minecraft_server.jar https://launcher.mojang.com/v1/objects/<version>/server.jar
COPY server.properties .
COPY eula.txt .
EXPOSE 25565
CMD ["java", "-Xmx2G", "-Xms1G", "-jar", "minecraft_server.jar", "nogui"]
