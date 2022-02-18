# Hapi #

## Start (manually) ##

`docker-compose -up -d`

`docker-compose logs -f`

## Configuration ##
Optional, just edit `applications.yaml`

## Makefile (convenience) ##

`make start` 

`make stop`

`make clean`

`make bash`



## FHIR base ##

[http://localhost:8081/fhir](http://localhost:8081/fhir)

## Tested environment ##

  * Windows 10
  * wsl2
  * DockerDesktop
  * ubuntu (packages: jq
