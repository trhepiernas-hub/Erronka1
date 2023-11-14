FROM nginx

RUN apt-get update && apt-get install -y curl unzip
RUN rm /usr/share/nginx/html/*
RUN curl -o /tmp/mi_archivo.zip 
