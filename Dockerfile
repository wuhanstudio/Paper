FROM node:alpine AS build
MAINTAINER wuhanstudio 

COPY . /home/node/app
WORKDIR /home/node/app

RUN npm install
RUN npx ng build

FROM nginx:alpine

COPY --from=build /home/node/app/dist/notes /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

