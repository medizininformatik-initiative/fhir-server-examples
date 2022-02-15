# IBM #

## Remarks ##
IBM ist configured to be use authorization for POST. Use https only.See "make count curl" to see how to handle that.
Initial start takes long. No named volume / "down" will erase content!

## Start (manually)##

`docker-compose -up -d`

`docker-compose logs -f`

## Configuration ##
?

## Makefile (convenience) ##

`make start` 

`make stop`

`make clean`

`make bash`



## FHIR base ##

[https://localhost:8084/fhir-server/api/v4](https://localhost:8084/fhir-server/api/v4)

## Tested environment ##

  * Windows 10
  * wsl2
  * DockerDesktop
  * ubuntu