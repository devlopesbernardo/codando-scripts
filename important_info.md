

## Please, use this command to create databases (considering the recent docker-compose.yml pls).

##### docker exec -it db_postgres psql -U postgres -c "CREATE DATABASE banco ENCODING 'LATIN1' TEMPLATE template0 LC_COLLATE 'C' LC_CTYPE 'C';"

## And this one to add user to this new database

##### docker exec -it db_postgres psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE banco TO postgres;"

## Guess what? Maybe you'd need to add a new user - no problems.

##### createuser -P -s -e joe