# fhir-server-examples #

Zusammenstellung: Frank Meineke (15.2.2022)

Motivation ist:
  * lade und starte öffentliche zugängliche FHIR Server als docker Container
  * geladen wird immer die mit "latest" getaggte Version
  * lade öffentlich zugängliche FHIR Daten 
  * genutzt werden die mit den Containern aktuell mitgelieferten Datenbanken (derby etc)
  * Performanztest sind damit nur sehr eingeschränkt / gar nicht möglich
  * die Server nutzen Ports ab 8081
  * der Firely/VONK Server benötigt eine (kostenlos erhältliche) Lizenz
  
## Prepare Testdata ##
Daten initial laden (hier: POLAR Testdaten). Es werden die zip Formate geladen und in einzelne json Dateien entpackt
`make data`

## Start Fhir Server ##
Goto specific server/XXX and type make start
or (für die Mutigen) cd server and type make start-all 
See ReadMe.md for endpoint

## Upload Data ##
./control.sh upload-all

## Count Data ##
./control.sh count-all

## Tested environment ##
  * Windows 10 (having 32GB)
  * wsl2 (using 16GB)
  * DockerDesktop
  * ubuntu (packages: install "jq" as json pretty printer, curl, wget, make, unzip)
