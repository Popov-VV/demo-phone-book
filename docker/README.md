### Docker-compose for work with Laravel project!

#### Includes: 
	PHP:7.2-fpm
	nginx:alpine
	postgres:11.5-alpine
	adminer
	composer installer
	npm installer

#### Before start look and edit .env
**APP_PORT** - port which use to run you main aplication (localhost::APP_PORT)  
**ADMINER_PORT** - port db client web service (localhost::ADMINER_PORT)  

**PREFIX_NAME** - prefix for docker container name | docker namespace =)  

**APP_PATH_HOST** - its path from docker to you project  
**APP_PATH_CONTEINER** - its inner name for docker work  

**DB_POSTGRES_PORT** - local port for datebase (use in env Laravel Project)  
**DB_DATABASE** - use datebase in project (use in env Laravel Project)  
**DB_USERNAME** - user datebase (use in env Laravel Project)  
**DB_PASSWORD** - user datebase (use in env Laravel Project)  

Check path from docker to you project and in you project env set next params for work db:
```
DB_CONNECTION=pgsql
DB_HOST=db
DB_PORT=  value from DOCKER env
DB_DATABASE= value from DOCKER env
DB_USERNAME= value from DOCKER env
DB_PASSWORD= value from DOCKER env
```


### Start docker container
```console
cd ~path/to/docker
docker-compose build
docker-compose up -d
```

#### Structure project:

```bash
docker
  ├── .docker
  │   ├── Dockerfile
  │   ├── nginx
  │   │   └── default.conf
  │   ├── php
  │   │   ├── php.ini
  │   │   └── xdebug.ini
  │   └── postgres
  │       └── extension-uuid.sql
  │
  ├── .dbPostgres (База данных)
  │   └── ...
  │
  ├── .nginxLogs (logs nginx)
  │   ├── access.log
  │   └── error.log
  │
  ├── README.md
  ├── .env
  ├── .gitignore
  └── docker-compose.yml

app
  └── public
    └── index.php
```

