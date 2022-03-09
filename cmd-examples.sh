#!/bin/bash
# some alias
alias composer='docker run --rm -v $(pwd):/app -v $HOME/.composer:/root/.composer php:local composer'
alias dc='docker-compose'
# start compose
dc up -d
dc start
dc stop
dc down

cd php_project
composer install
