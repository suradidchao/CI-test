FROM node:11.10.1-alpine as build-stage
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx as production-stage
EXPOSE 80
COPY --from=build-stage /app/dist /usr/share/nginx/html