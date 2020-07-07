FROM node:12

LABEL maintainer="hazem.ataya94@gmail.com"

WORKDIR /app

COPY . .

SHELL ["/bin/bash", "-c"]

RUN useradd -m -d /home/node-user node-user \
    && chown node-user:node-user /app

USER node-user

RUN npm install

ENV PORT=3000

ENTRYPOINT ["node", "server.js"]

EXPOSE ${PORT}
