# use a node base image
FROM node:6-alpine
WORKDIR /app

COPY  . /app

RUN npm install

EXPOSE 8085
CMD [ "npm", "start" ]
