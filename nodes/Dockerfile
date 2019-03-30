FROM node:10-alpine
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
COPY . /app
CMD node app.js
EXPOSE 9090

