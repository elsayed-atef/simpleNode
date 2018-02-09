# use a node base image
FROM node:6-alpine

COPY  . /app
RUN ls -l /app


EXPOSE 3000
