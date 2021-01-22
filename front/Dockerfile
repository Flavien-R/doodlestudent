FROM ubuntu as front1

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN git clone https://github.com/Flavien-R/doodlestudent.git

FROM node as front2

COPY --from=front1 doodlestudent ./doodlestudent

RUN cd doodlestudent/front && \
	npm i && \
	npm run build
	
FROM bunkerity/bunkerized-nginx

COPY --from=front2 doodlestudent ./doodlestudent

RUN cp -r /doodlestudent/front/dist/tlcfront/. /www/
