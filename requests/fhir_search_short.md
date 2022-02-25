# Example requests using FHIR Search

## About
This file contains example requests that can be used with the test FHIR Servers generated from the dockerfiles in the server directory. To keep this overview accessible as possible, the requests here are provided as simple strings. You can copy them and use them in a tool of your choice, e.g. a web browser, Postman or using by cURL directly from the shell. This document doesn't explain the requests. There is an explained version if you prefer that.

Each request starts with `[base]`, which has to be substituted with the address under which the FHIR Server can be reached.

The rest of this document covers FHIR search requests of increasing complexity.


 Request                                                                          | Showcase
----------------------------------------------------------------------------------|---------
`GET [base]/Patient`                                                              | Get all resources of a specific type
`GET [base]/Patient?_count=100`                                                   | Change page-/ bundlesize to 100
`GET [base]/Patient?_summary=count`                                               | Return count only
`GET [base]/Patient?gender=female`                                                | Restrict results based on gender
`GET [base]/Patient?birthdate=le1980-01-01`                                       | Use quantifiers
`GET [base]/Observation?code=http://loinc.org/|15074-8`                           | Combine code and codesystem info in one parameter value
`GET [base]/Observation?code=http://loinc.org/%7C15074-8`                         | URL encode special characters
`GET [base]/Patient?gender=female&birthdate=lt1980-01-01`                         | Combine several parameters (=AND)
`GET [base]/Patient?gender=female,other`                                          | Combine several values (=OR)
`GET [base]/Patient?gender=female&gender=other`                                   | Example of a useless AND-combination
`GET [base]/Patient?gender=female&birthdate=lt1980-01-01&_summary=count`          | Extract count for feature combination
`GET [base]/Observation?_include=Observation:subject`                             | Include resources linked by the base resource
`GET [base]/Patient?_revinclude=Observation:subject`                              | Include resources the base resource is referenced by
`GET [base]/Observation?code=http://loinc.org|15074-8&_include=Observation:subject`| Restrict the include search result based on the base resource
`GET [base]/Patient?birthdate=lt1980-01-01&_revinclude=Observation:subject`       | Restrict the revinclude search result based on the base resource










