FROM openjdk:11-jre

EXPOSE 8085

ADD testing-web-2.6.0.jar /app/testing-web-2.6.0.jar

WORKDIR /app

CMD java -jar testing-web-2.6.0.jar
