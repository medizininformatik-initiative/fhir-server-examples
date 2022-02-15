# fhir-server-examples #

## Prepare Testdata ##
`make data`

## Start Fhir Server ##
Goto specific server/XXX and type make start
or goto server and type make start-all 
See ReadMe.md for endpoint

## Upload Data ##
./control.sh upload-all

## Count Data ##
./control.sh count-all

## Tested environment ##
  * Windows 10 (having 32GB)
  * wsl2 (using 16GB)
  * DockerDesktop
  * ubuntu (packages: install "jq" as json pretty printer)
