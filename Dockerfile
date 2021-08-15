FROM caddy:latest

WORKDIR /app

COPY ./site ./site
COPY ./Caddyfile ./Caddyfile
COPY ./index.html ./site/index.html
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

CMD ["caddy", "run"]