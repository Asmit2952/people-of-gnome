#!/bin/bash

# include rvm here
source ~/.rvm/scripts/rvm

# use ruby 2.6.8
rvm use 2.6.8

GEM_PATH=.bundle
BUNDLER_PATH=$GEM_PATH/bin

echo -e "\n💡 \033[1;31mplease access via localhost and not 127.0.0.1! \033[0m"

echo -e "\n🎉 \033[1;34mstarting jekyll \033[0m\n"

$BUNDLER_PATH/bundle exec jekyll s --watch --livereload --host=localhost
