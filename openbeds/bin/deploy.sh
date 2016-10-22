#!/bin/bash

cd "$(dirname $0)/../"
grails war -Dgrails.env=development
mv target/*.war openbeds.war

heroku deploy:war openbeds.war
