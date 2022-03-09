#!/bin/bash
# some alias
alias composer='docker run --rm -v $(pwd):/app -v $HOME/.composer:/root/.composer php:local composer'
alias dc='docker-compose'
# start composer
dc up -d
dc start
dc stop
dc down
