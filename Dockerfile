FROM node:18-alpine

WORKDIR /usr/src/app

COPY temp-app/bulletin-board-app/package.json .

RUN npm install

COPY temp-app/bulletin-board-app/ .

EXPOSE 8080
CMD ["npm", "start"]
