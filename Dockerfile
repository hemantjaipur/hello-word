# use the official Node.js image as a base
FROM node:18 AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build --configuration= production 
 
# Use Nginx to serve the angular app

FROM nginx:alpine

COPY --from=build /app/dist/angular-app  /usr/share/nginx/html

CMD ["nginx","g","daemon off"]
