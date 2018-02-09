# use a node base image
FROM node:6-alpine
RUN apt-get install -y git
RUN git clone https://github.com/sayed24/simpleNode.git



EXPOSE 3000
