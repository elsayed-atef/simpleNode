# use a node base image
FROM node:6-alpine
RUN mkdir /app
COPY  . /app
WORKDIR /app
RUN pwd
RUN ls -l
RUN npm install

EXPOSE 8085
CMD ["npm" , "start"]
