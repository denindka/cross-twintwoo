FROM node:14

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install --no-install-recommends -y && \
	rm -rf /var/lib/apt/lists/* && \
    apt-get clean

WORKDIR /app

COPY package*.json /app/

RUN npm ci

COPY . /app

CMD npm run start
