FROM node:11.9.0-alpine

ENV PATH=/opt/node_modules/.bin:$PATH

WORKDIR /opt/app

RUN mkdir -p /opt/node_modules/.cache && echo -e "--modules-folder /opt/node_modules\n--cache-folder /opt/node_modules/.cache" > /opt/app/.yarnrc && chown -R node:node /opt/*

COPY --chown=node:node ["package.json", "yarn.lock", "/opt/app/"]

RUN yarn install

COPY --chown=node:node [".", "/opt/app/"]

ENTRYPOINT ["/opt/yarn-v1.13.0/bin/yarn", "start"]
