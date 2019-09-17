### Demo App

#### Instruction
```
git clone https://github.com/Axeres/demo-phone-book
cd demo-phone-book/docker
```

You may change params in .env file.

```
docker-compose build
docker-compose up -d

docker-compose exec app bash 
  cp .env.example .env
```
composer and npm installers was run to background, and if you next command doesn't work, please wait

```
  php artisan key:generate
  php artisan migrate --seed

  cd ../web-app
  npm run build

  exit
```


Edit you hosts file and add:
```
127.0.0.1 api-app.dev
127.0.0.1 web-app.dev
```

Open http://web-app.dev

and you so open adminer DB in localhost:9999

select postgresDb
enter:
```
username: demoUser
password: passwordUser
db name: demoApp
```






