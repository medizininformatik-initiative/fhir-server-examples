# IBM #

## Remarks ##
IBM ist configured to use authorization for POST. See "make count curl" to how to handle that.
Initial start takes long. No named volume / "down" will erase content!

## Start (manually) ##

`docker-compose up -d`

`docker-compose logs -f`

## Configuration ##
server.xml is changed (new endpoint, use http instead of https) and mounted as my-server.xml.

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
