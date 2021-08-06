FROM caddy:latest

WORKDIR /app
COPY ./* ./*
RUN npm install

CMD ["caddy", "run"]