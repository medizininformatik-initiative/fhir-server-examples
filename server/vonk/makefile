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
# actally no bash but only sh
	docker exec -it vonk sh
count:
	curl -s ${base}/Patient?_summary=count
