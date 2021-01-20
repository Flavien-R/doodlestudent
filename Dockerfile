FROM ubuntu

ENV TZ=Europe/Paris

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN apt-get install -y openjdk-8-jdk

RUN git clone https://github.com/Flavien-R/doodlestudent.git

// compiler le projet puis utiliser le res avec le nginx
