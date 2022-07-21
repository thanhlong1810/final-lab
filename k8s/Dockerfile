FROM node:16.16.0-alpine3.15
WORKDIR /var/www/landing

COPY . .

RUN yarn
RUN yarn build

EXPOSE 3000

CMD [ "yarn", "start" ]