# Vonk /firely) #

## Start (manually)##

`docker-compose -up -d`

`docker-compose logs -f`

## Configuration ##
appsettings.json

You need a "firelyserver-license.json"  and store ist accordingly (see docker-compose.yml).
For e.g put in in /home/frank/vonk/license
and define volume /home/frank/vonk/license:/app/license

## Makefile (convenience) ##

`make start` 

`make stop`

`make clean`

`make bash`



## FHIR base ##

[http://localhost:8083/fhir](http://localhost:8083/fhir)

## Tested environment ##

  * Windows 10
  * wsl2
  * DockerDesktop
  * ubuntu (packages: jq
