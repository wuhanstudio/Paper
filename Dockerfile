FROM node:alpine AS build
MAINTAINER wuhanstudio 

COPY . /home/node/app
WORKDIR /home/node/app

RUN npm install
RUN npx ng build

FROM node:alpine

COPY --from=build /home/node/app/dist/notes /home/node/app/

RUN npm install -g serve

WORKDIR /home/node/app

EXPOSE 5000

CMD ["serve", "-s", "notes"]

