current_dir := $(shell pwd)

run:
	docker run --rm --detach --publish 8080:8080 --volume ${current_dir}:/home/wiremock rodolpheche/wiremock:2.25.1-alpine

requests:
	curl -v http://localhost:8080/__admin/requests

hello:
	curl -v http://localhost:8080/hello/world

verify-hello:
	curl -XPOST -d @verify/hello_called.json http://localhost:8080/__admin/requests/count

hello-post:
	curl -v -XPOST http://localhost:8080/hello

countries:
	curl -v http://localhost:8080/countries

countries-delayed:
	curl -v http://localhost:8080/countries-delayed

malformed:
	curl -v http://localhost:8080/malformed

close:
	curl -v http://localhost:8080/close

record:
	curl -v -XPOST -d '{"targetBaseUrl": "https://api.tfl.gov.uk"}' http://localhost:8080/__admin/recordings/start
	curl -v http://localhost:8080/Line/Mode/tube
	curl -v http://localhost:8080/Line/bakerloo/Status?detail=false
	curl -v http://localhost:8080/Line/bakerloo/Route/Sequence/inbound
	curl -v -XPOST http://localhost:8080/__admin/recordings/stop