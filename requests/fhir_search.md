# Example requests using FHIR Search

## About
This file contains example requests that can be used with the test FHIR Servers generated from the dockerfiles in the server directory. To keep this overview accessible as possible, the requests here are provided as simple strings. You can copy them and use them in a tool of your choice, e.g. a web browser, Postman or using by cURL directly from the shell. This document explains each request in some detail. There is a shorter version listing just the requests if you prefer that.

Each request starts with `[base]`, which has to be substituted with the address under which the FHIR Server can be reached. The request `[base]/Patient` for example would have to converted to `http:/localhost:8081/fhir/Patient` if you are using the hapi server that is created be the docker-compose file in this project.

The rest of this document covers FHIR search requests of increasing complexity.

## Single resource type - no search parameters
The structurally simplest query asks the server to return all Resources of a certain resource type, e.g. all Patient resources:

`GET [base]/Patient`

The result will be a FHIR bundle of type searchset containing Patient resources. Note that the server will not return all Patient resources at once but only the first few, i.e. the first page of the search result. The size of a page / a single bundle is controlled with the `_count` parameter like this:

`GET [base]/Patient?_count=100`

The above query returns the first 100 Patient resources. To get to the next 100, you have to extract the url to the next page which is located in `Bundle.link.url` where `Bundle.link.relation` is `"next"`.

You can then retrieve the next page from the server by sending 

` GET <nextURL>`.

If you are just interested in how many resources there are on the server without wanting to download the actual resources you can add the `_summary=count` to your query like this:

`GET [base]/Patient?_summary=count`

This will return a searchset bundle with just a count of the available Patient resources.

## Single resource type with search parameters

### Single Parameter
Each resource type comes with a set of specific search parameters. As opposed to the few parameters that apply to all resource types, the resource specific search parameters usually don't start with a `_`. You can find an overview over the FHIR core search parameters of a specific resource at the bottom of the resources' page on hl7.org/FHIR, e.g. at https://hl7.org/FHIR/patient.html#search.

The search parameters allow to restrict the search result to a certain sub population. To only get female Patient resources, you can for example ask the following:

`GET [base]/Patient?gender=female`

Note that while a lot of the search parameter are called the same as the element they are querying (`gender` queries the element `Patient.gender`), the search parameter and corresponding element name are not interchangeable (e.g. `birthdate` queries `Patient.birthDate` and `patient` queries the element `Encounter.subject`).


Some parameters can make use of modifiers. The following request returns Patients with a birthdate that is less or equal to (`le`) 1980-01-01.

`GET [base]/Patient?birthdate=le1980-01-01`

Other parameters, like search parameters of type `token` that work on codes identifiers, can take more than one piece information as their value. When searching for a code from a certain code system, you can for example tell the server to look for the code `15074-8` from the code system `http://loinc.org/` like this:

`GET [base]/Observation?code=http://loinc.org/|15074-8`

The `|` that is used to divide system and code may have to be url encoded in some applications like this:

`GET [base]/Observation?code=http://loinc.org/%7C15074-8`


### Combinations of parameters
You can also combine search parameters, for example ask for all patients that are female *and* are born before 1980:

`GET [base]/Patient?gender=female&birthdate=lt1980-01-01`

FHIR Search will interpret the `&` connecting different parameters as a logical **AND**, thus generating the intersection of the two individual search results. Creating a set union of the individual search results (corresponding to a logical **OR**) is not possible when you want to connect different search parameters. E.g. FHIR Search doesn't let you search for all Patients that are female *or* born before `1980-01-01`. 

You can, however, **OR**-combine multiple values for the *same* search parameter by comma-separating them like this:

`GET [base]/Patient?gender=female,other`

The above request returns all Patients that have `female` *or* `other` as their gender. In contrast

`GET [base]/Patient?gender=female&gender=other`

would ask for all Patients having `female` *and* `other` listed as their gender (which does not make sense).

All of the above requests return a bundle containing the full resources matching the request. If you append `&_summary=count` to them, you can change the search result to a count of the matching resources:

`GET [base]/Patient?gender=female&birthdate=lt1980-01-01&_summary=count`

## Retrieve multiple resource types 
You can retrieve multiple resource types if one type is linked to the other via a reference element. 

### _include
From the perspective of the base resource of the request (Observation in the following example), the `_include` parameter includes all resources linked to in a certain reference type element of the base resource. Which reference element to include is specified by a search parameter of the base resource that queries the reference type element (e.g. `subject` in the example). The `_include` takes the following general form: `_include=<baseResource>:<ReferenceSearchParam>` 

`GET [base]/Observation?_include=Observation:subject`

The above request retrieves all Observations as well as all resources linked in the `subject` element (those are often Patient resources).

### _revinclude
From the perspective of the base resource of the request, the `_revinclude` parameter includes resources that link to that base resource, so this works in the opposite direction. Its structure is `_revinclude=<LinkingResource>:<ReferenceSearchParam>`, where `<LinkingResource>` is the resource referencing the base resource and `<ReferenceSearchParam>` is a search parameter of the linking resource querying the reference element that points to the base resource:

`GET [base]/Patient?_revinclude=Observation:subject`

The above request returns all Patient resources as well as all Observations that link to those Patients.

You can also restrict the search result based on attributes of the base resource, e.g. by asking for all Observations containing a certain loinc code and the resources they link to in their subject element:

`GET [base]/Observation?code=http://loinc.org|15074-8&_include=Observation:subject`

Or you can ask for all Patients born before 1980 and the Observations linking to those Patients:

`GET [base]/Patient?birthdate=lt1980-01-01&_revinclude=Observation:subject`









