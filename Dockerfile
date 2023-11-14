FROM nginx

RUN apt-get update && apt-get install -y curl unzip
RUN rm /usr/share/nginx/html/*
RUN curl -L -o /tmp/WebOrria.zip https://github.com/trhepiernas-hub/Erronka1/raw/main/WebOrria.zip
RUN unzip /tmp/WebOrria.zip -d /usr/share/nginx/html
RUN rm /tmp/WebOrria.zip

