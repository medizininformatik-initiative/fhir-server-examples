# IBM #

## Remarks ##
IBM ist configured to use authorization for POST. ee "make count curl" to see how to handle that.
Initial start takes long. No named volume / "down" will erase content!

## Start (manually)##

`docker-compose up -d`

`docker-compose logs -f`

## Configuration ##
?

## Makefile (convenience) ##

`make start` 

`make stop`

`make clean`

`make bash`



## FHIR base ##

[https://localhost:8084/fhir](https://localhost:8084/fhir)

## Tested environment ##

  * Windows 10
  * wsl2
  * DockerDesktop
  * ubuntu
