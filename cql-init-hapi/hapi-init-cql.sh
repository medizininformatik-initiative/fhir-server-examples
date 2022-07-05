#!/bin/sh

fhirBaseUrl=http://localhost:8081/fhir

curl -XPUT -H 'Content-Type: application/fhir+json' \
  -d @library-fhir-model-definition.json \
  $fhirBaseUrl/Library/fhir-model-definition

curl -XPUT -H 'Content-Type: application/fhir+json' \
  -d @library-fhir-helpers.json \
   $fhirBaseUrl/Library/FHIRHelpers
