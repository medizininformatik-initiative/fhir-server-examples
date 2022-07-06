from importlib import resources
import requests
import json
import base64
import uuid

cql_input = '''
library Retrieve version '1.0.0'
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

context Patient

define InInitialPopulation:
  Patient.gender = 'female'
'''


library_template = '''{
  "resourceType": "Library",
  "version": "1.0.0",
  "name": "Retrieve",
  "url": "",
  "status": "active",
  "type" : {
    "coding" : [
      {
        "system": "http://terminology.hl7.org/CodeSystem/library-type",
        "code" : "logic-library"
      }
    ]
  },
  "content": [
    {
      "contentType": "text/cql",
      "data": ""
    }
  ]
}'''


measure_template = '''{
  "resourceType": "Measure",
  "url": "",
  "status": "active",
  "library":[""],
  "scoring": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/measure-scoring",
        "code": "cohort"
      }
    ]
  },
  "group": [
    {
      "population": [
        {
          "code": {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/measure-population",
                "code": "initial-population"
              }
            ]
          },
          "criteria": {
            "language": "text/cql",
            "expression": "InInitialPopulation"
          }
        }
      ]
    }
  ]
}'''

fhir_base_url = "http://localhost:8081/fhir"

cql_base64 = base64.b64encode(cql_input.encode('ascii'))

lib_uuid = f'urn:uuid:{str(uuid.uuid4())}'
measure_uuid = f'urn:uuid:{str(uuid.uuid4())}'

lib = json.loads(library_template)
lib['url'] = lib_uuid
lib['content'][0]['data'] = cql_base64.decode('ascii')

print("Creating Library Resource on fhir server...")
headers = {'Content-Type': "application/fhir+json"}
resp = requests.post(f'{fhir_base_url}/Library', data=json.dumps(lib), headers=headers)
lib_id = resp.json()['id']

print("Creating Measure Resource on fhir server...")
measure = json.loads(measure_template)
measure['library'][0] = f'Library/{lib_id}'
resp = requests.post(f'{fhir_base_url}/Measure', data=json.dumps(measure), headers=headers)
measure_id = resp.json()['id']

print(f'Evaluating Measure Resource with id {measure_id}')
evaluate_measure_url = f'{fhir_base_url}/Measure/{measure_id}/$evaluate-measure?periodStart=2000&periodEnd=2030'
resp = requests.get(evaluate_measure_url)

resources_found = resp.json()['group'][0]['population'][0]['count']
print(f'Number of patients found: {resources_found}')
