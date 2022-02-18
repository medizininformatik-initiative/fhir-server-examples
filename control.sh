#!/bin/bash

HAPI=http://localhost:8081/fhir
BLAZE=http://localhost:8082/fhir
VONK=http://localhost:8083/fhir
IBM=http://localhost:8084/fhir

base=$IBM
base=$BLAZE
base=$IBM
base=$HAPI
base=$BLAZE
base=$IBM
base=$VONK

# json_pp (breaks on Umlauet, jq seems more robust)
# _pretty=true ist sometimes ignored / not implemented

_test() {
	curl --insecure --location --user "fhiruser:change-password" "$base/Encounter" --header "Content-Type: application/json" | jq
}

test() {
	curl --insecure --location --user "fhiruser:change-password" "$base/Encounter" --header "Content-Type: application/json" | jq
#	curl --insecure --location --user "fhiruser:change-password" "$base/Encounter?date=ge2010-01-01" --header "Content-Type: application/json" | jq
#	curl --insecure --location --user "fhiruser:change-password" "$base/Encounter?_include=*tty=true" --header "Content-Type: application/json" | jq
#	curl --insecure --location --user "fhiruser:change-password" "$base/Encounter?_include=Encounter:subject&_include=Encounter:diagnosis.condition" --header "Content-Type: application/json"
#	curl --insecure --location --user "fhiruser:change-password" "$base/Encounter?_include=Encounter:subject&_include=Encounter:diagnosis" --header "Content-Type: application/json" | jq
#	curl --insecure --location --user "fhiruser:change-password" "$base/MedicationAdministration?_include=MedicationAdministration:context" --header "Content-Type: application/json" | jq
#	curl --insecure --location --user "fhiruser:change-password" "$base/MedicationStatement?_include=MedicationStatement:context" --header "Content-Type: application/json" | jq
	#	curl --insecure --location --user "fhiruser:change-password" "$base/Encounter?_pretty=true" --header "Content-Type: application/json"
}

_upload() {
	for f in $*
	do
		echo -n upload $f 200=ok: 
		curl --retry 3 --retry-delay 2 -s -o /dev/null -w "%{http_code}" --data-binary @$f --insecure --location --user "fhiruser:change-password" --request POST $base --header "Content-Type: application/json"
		echo
	done
}

upload() {
	_upload data/*.json
}

upload-parallel() {
	ls data/*.json | xargs -n 2 -P 0 ./control.sh _upload 
	wait
}

	
_count(){
	# _pretty=true
	# echo curl --insecure --location --user "fhiruser:change-password" -s "$base/$1?_summary=count&_pretty=true" 
	C=`curl --insecure --location --user "fhiruser:change-password" -s "$base/$1?_summary=count" | json_pp | awk '/total/{print $0}'`
	echo found $C ${1}s 
}

count() {
	echo check $base
	_count Patient
	_count Encounter
	_count Observation
	_count Procedure
	_count Medication
	_count MedicationStatement
	_count MedicationAdministration
}

upload-all() {
	for a in $HAPI $VONK $IBM $BLAZE
	do
		base=$a
		upload
	done
}
count-all() {
	for a in $HAPI $VONK $IBM $BLAZE
	do
		base=$a
		count
	done
}

help()  {
	echo Declared functions
	declare -F | awk  '{print $3}'
}

"$@"

