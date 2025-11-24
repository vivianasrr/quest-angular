FROM node:lts-bullseye AS build

WORKDIR /app


COPY package.json package-lock.json* ./
RUN npm install

COPY . .

RUN ./node_modules/.bin/ng build --configuration production



FROM nginx:latest

WORKDIR /app

COPY nginx-default.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist/quest-angular/browser /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
