# use a node base image
FROM node:6-alpine
WORKDIR /app

COPY  . /app

RUN npm install

EXPOSE 3000
CMD [ "npm", "start" ]
