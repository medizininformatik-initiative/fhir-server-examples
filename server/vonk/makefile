base=http://localhost:8083/fhir

start:
	docker-compose up -d
log:
	docker-compose logs -f
stop:
	docker-compose stop
clean:
	docker-compose down	
bash:
	docker exec -it hapi bash
count:
	curl -s ${base}/Patient?_summary=count
