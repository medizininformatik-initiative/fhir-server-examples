# Vonk / firely) #

## Makefile (convenience) ##
  * `make start` # start docker
  * `make stop` #  stop docker (will not wipe content)
  * `make clean` # wipe volume
  * `make bash` # enter container (here: sh)

## Configuration ##
Edit `appsettings.json`.

You need a "firelyserver-license.json"  and store it accordingly (see docker-compose.yml).
For e.g put in in /home/$USER/vonk/license
and define volume /home/$USER/vonk/license:/app/license

## FHIR base ##
[http://localhost:8083/fhir](http://localhost:8083/fhir)
