# ERRONKA1

## Nola montatu zerbitzari sistema

### Lehen aukera

- github-etik repositorio hau deskargatuko dugu `git clone https://github.com/trhepiernas-hub/Erronka1` 
- behin deskargatuta deskargatutako karpetatara juango gara eta  `docker-compose up` jarriko dugu terminalean.
- odoo zerbizarira sartu beharko gara erabiltzailea datubase eta pasahitz bat sortu beharko dugu.
- azkenik duplicati aplikazioan sartu eta sources karpeta backus karpetara guk dai degun frezuektziarekin segurtasun kopia egitea konfiguratu
- eta horrela gure sistema prest dago erabitzeko.

### Bigarren aukera

- hemengo kode hau fitxategi batera kopiatu eta gero `docker-compose up` ejekutatu

```
version: '3.1'
services:
  odoo:
    image: odoo
    ports:
      - 8069:8069
    volumes:
      - odoo-data:/var/lib/odoo
    depends_on:
      - db
    container_name: odoo
  db:
    image: postgres:15
    restart: always
    volumes:
      - odooDB:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: odoo
      POSTGRES_PASSWORD: odoo
      POSTGRES_DB: postgres
    container_name: db
  weborria:
    image: nginx
    build: 
      context: https://github.com/trhepiernas-hub/Erronka1.git#main
      dockerfile: ./dockerfile.nginx
    restart: always
    ports:
      - 8080:80
    volumes:
      - ngixn-data:/usr/share/nginx/html:ro
    container_name: WebOrria
  duplicati:
    image: lscr.io/linuxserver/duplicati:latest
    container_name: duplicati
    build: 
      context: https://github.com/trhepiernas-hub/Erronka1.git#main
      dockerfile: ./dockerfile.duplicati
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Madrid
    volumes:
      - duplicati-backups:/backups
      - duplicati-source:/source
    ports:
      - 8200:8200
    restart: unless-stopped
volumes:
  ngixn-data:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: C:/Erronka/container/web
  odoo-data:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: C:/Erronka/container/odoo-data
  odooDB:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: C:/Erronka/container/odooDB
  duplicati-backups:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: C:/Erronka/duplicati/backups
  duplicati-source:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: C:/Erronka/container
  duplicati-config:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: C:/Erronka/duplicati/config
```

- odoo zerbizarira sartu beharko gara erabiltzailea datubase eta pasahitz bat sortu beharko dugu.
- azkenik duplicati aplikazioan sartu eta sources karpeta backus karpetara guk dai degun frezuektziarekin segurtasun kopia egitea konfiguratu
- eta horrela gure sistema prest dago erabitzeko.

## Dituen aplikazioak

- odoo erp crm sitema bat gure produktu eta bezeroen datuak gordetzeko
- postgresDB odoo aplikazioaren datu guztiak gordetzeko
- nginx zerbitzari bat web orria edukitzeko
- dulpicati backup zerbitzaria segurtasun kopiak egiteko