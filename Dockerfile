FROM node:10.15.1-slim

LABEL maintainer="Hugo Leote <hleote@gmail.com>"

# RUN apt-get -y -qq update
# RUN apt-get -y -qq install python python-pip build-essential libpq-dev rsync

# RUN pip install awscli

RUN mkdir /home/node/app

WORKDIR /home/node/app

# COPY ./.npmrc .
COPY ./package.json .
COPY ./yarn.lock .

# ARG npm_token
# ENV NPM_TOKEN=${npm_token}

RUN npm install

COPY . .

# RUN yarn build

USER node

CMD ["npm","run","start"]