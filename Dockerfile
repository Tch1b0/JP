FROM caddy:latest
FROM node:latest

WORKDIR /app

COPY ./src ./src
COPY ./.babelrc ./.babelrc
COPY ./Caddyfile ./Caddyfile
COPY ./index.html ./site/index.html
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
COPY ./webpack.config.js ./webpack.config.js

RUN npm install
RUN npm run build

CMD ["caddy", "run"]