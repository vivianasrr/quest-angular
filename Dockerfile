FROM nginx:latest

COPY nginx-default.conf /etc/nginx/conf.d/default.conf

COPY /app/dist/quest-angular/browser /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 81
