docker run --name curious-moon -v ~/_Projects/2020-02-18_POSTGRES_moon/curious_moon_book/c-moon-vol:/c-moon-vol -e POSTGRES_PASSWORD=postgres -d -p 5432:5432 postgres





1. `docker inspect my_container

2. The network assigned to PostgreSQL was:

   "Networks": {            "docker_default": {                "IPAddress": "172.18.0.2",                ...            }        }





https://stackoverflow.com/questions/15301826/psql-fatal-role-postgres-does-not-exist/31712520#31712520

sudo -u postgres psql

```
apt-get update && apt-get install make
```

sudo -u postgres psql postgres

 sudo -u postgres  psql enceladus



https://launchschool.com/blog/how-to-install-postgres-for-linux



sudo -u postgres psql enceladus < build.sql