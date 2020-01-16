FROM node:12

ARG MAXMIND_API_KEY

EXPOSE 8080

WORKDIR /code

COPY package.json package-lock.json /code/
RUN npm install
RUN cd node_modules/geoip-lite && npm run-script updatedb license_key=$MAXMIND_API_KEY
COPY . .
RUN npm run build

CMD [ "npm", "start" ]
