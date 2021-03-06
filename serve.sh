#!/bin/sh

set -e

echo "\033[0;1mBuilding for environment: \033[0;1;35mdevelopment\033[0;0m"

echo "\033[0;1mHugo version\033[0;0m"
hugo version

# Run "npm install" in the theme folder
# Then symlink node_modules so hugo can build the site
echo "\033[0;1mRefreshing theme dependencies...\033[0;0m"
(cd themes/withblueink && npm install)
[ ! -e node_modules ] && ln -s -v themes/withblueink/node_modules

# Compile the code with the "production" environment
echo "\033[0;1mBuilding and starting web server...\033[0;0m"
hugo serve --environment=development --buildFuture --buildDrafts --disableFastRender
