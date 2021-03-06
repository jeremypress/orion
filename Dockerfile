FROM node:8.6.0

# Create app directory
WORKDIR /usr/src/app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Bundle app source
COPY . .

# Use prod-config, comment out to use local env config
COPY prod-config.json ./config.json
COPY prod-s3.json ./prod-s3.json

# Google Cloud to Cassandra Version
# CMD [ "npm", "start" ]
# AWS to S3 Version
EXPOSE 8080
EXPOSE 80
CMD [ "npm", "run", "start-s3" ]

# Build
# docker build -t orion .

# Run
# docker run -p 8080:8080 orion:latest
