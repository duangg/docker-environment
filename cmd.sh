# composer install 
docker run --rm -v $(pwd):/app -v $HOME/.composer:/root/.composer php:meicai composer install

# start composer
docker-compose up -d
docker-compose start
docker-compose stop
docker-compose down

