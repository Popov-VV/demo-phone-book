### Demo App

#### Instruction
```
git clone https://github.com/Axeres/demo-phone-book
cd demo-phone-book/docker
```

You may change params in .env file.

```
docker-compose build
docker-compose up
```

After composer and npm installers return exit code 0 and end work, open new tab and run migration for db:
```
docker-compose exec app bash 
  php artisan migrate --seed
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






