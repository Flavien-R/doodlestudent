FROM ubuntu

ENV TZ=Europe/Paris

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y openjdk-11-jdk

RUN apt-get install -y maven

RUN git clone https://github.com/Flavien-R/doodlestudent.git && \
	cd doodlestudent/api && \
	mvn package compile -Dmaven.test.skip=true -Dquarkus.package.type=uber-jar
