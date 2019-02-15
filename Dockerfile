# Base Image
FROM node:alpine

# install simple http server for serving static content
RUN npm install -g http-server

# Set working directory in the docker container
WORKDIR '/app'

# Copy over package.json
COPY ./package*.json ./

# Run npm install
RUN npm install

# Copy over everything now
COPY . .

# build app for production with minification
RUN npm run build

EXPOSE 8080

# Run the command to get the site up
CMD [ "http-server", "./" ]