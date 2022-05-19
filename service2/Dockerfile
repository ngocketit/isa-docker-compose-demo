FROM node:latest
WORKDIR /app
COPY package*.json /
RUN npm install
EXPOSE 9002
CMD ["node", "index.js"]
