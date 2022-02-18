# fhir-server-examples #

Compiled by Frank Meineke (2022-02-15) as part of the MII Taskforce DDT.

Features
  * load and start publicly available FHIR servers as docker containers.
  * always load the "latest" tagged version
  * load publicly available FHIR data 
  * use the databases that are currently delivered with the containers (derby etc)
  * integrate server into the HAPI tester frontend  (except IBM)
  * Note: performance tests are only possible to a very limited extent / not at all
  
### Supported Servers ###
| Server      | Endpoint | Remark
| ----------- | ----------- | ----------- 
| [Hapi](server/hapi)   | http://localhost:8081/fhir | 
| [Blaze](server/blaze)      | http://localhost:8082/fhir |
| [Vonk/Firely](server/vonk)  | http://localhost:8083/fhir | License needed
| [IBM](server/ibm)   | http://localhost:8084/fhir | Authorization needed


## Preparation ##
  * Load data (here: POLAR testdata). The zip formats are loaded and unpacked to json files. `make data`
  * for vonk: get your personal trial license file from https://simplifier.net/firely-server 

## Start FHIR Server ##
Goto specific server/XXX and type `make start` individually 
or (for the brave) type `make -C server start-all`

## Upload Data ##
`make upload-all`

## Count Data ##
`make count-all`

## Tested environment ##
  * Windows 10 (Ryzen 5, 32GB)
  * wsl2 (using 16GB, necessary if all servers are running)
  * DockerDesktop
  * ubuntu (packages: install "jq" as json pretty printer, curl, wget, make, unzip)
