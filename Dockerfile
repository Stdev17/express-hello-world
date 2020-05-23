FROM node:10
MAINTAINER https://berylleta.dev

# install deps
ADD package.json /tmp/package.json
RUN cd /tmp && npm install && npm install -g jest

# Copy deps
RUN mkdir -p /opt/hello-world && cp -a /tmp/node_modules /opt/hello-world

# Run test(jest)
CMD ["jest"]

# Setup workdir
WORKDIR /opt/hello-world
COPY . /opt/hello-world

# run
EXPOSE 3000
CMD ["npm", "start"]