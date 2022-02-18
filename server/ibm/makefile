base=http://localhost:8084/fhir

start:
	docker-compose up -d
log:
	docker-compose logs -f
stop:
	docker-compose stop
clean:
	docker-compose down	

bash:
	docker exec -it ibm bash
count:
	curl  --insecure --location --user "fhiruser:change-password" -s ${base}/Patient?_summary=count
