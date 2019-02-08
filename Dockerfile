FROM node:11.9.0-alpine

ENV NODE_PATH=/var/node_modules
#ENV PATH=/var/node_modules/.bin:$PATH

WORKDIR /app

RUN chown node:node /app

COPY --chown=node:node ["package.json", "yarn.lock", "/app/"]

RUN yarn install --modules-folder /var/node_modules

COPY --chown=node:node [".", "/app/"]

ENTRYPOINT ["/opt/yarn-v1.13.0/bin/yarn", "--modules-folder", "/var/node_modules", "start"]
