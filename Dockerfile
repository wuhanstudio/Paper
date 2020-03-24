FROM node:alpine
MAINTAINER wuhanstudio 

COPY . /home/node/app
WORKDIR /home/node/app

RUN npm install
RUN npm install -g serve
RUN npx ng build

EXPOSE 5000
CMD ["serve", "-s", "dist/notes"]
