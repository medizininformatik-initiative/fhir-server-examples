base=http://localhost:8081/fhir

start:
	docker-compose up -d
log:
	docker-compose logs -f
stop:
	docker-compose stop
clean:
	docker-compose down	
	docker volume rm hapi_hapi-data

bash:
	docker exec -it hapi bash
count:
	curl -s ${base}/Patient?_summary=count
