base=http://localhost:8082/fhir

start:
	docker-compose up -d
log:
	docker-compose logs -f
stop:
	docker-compose stop
clean:
	docker-compose down	
	docker volume rm blaze_blaze-data

bash:
	docker exec -it hapi bash
count:
	curl -s ${base}/Patient?_summary=count
