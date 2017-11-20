.PHONY: docker clean debug cleanup docker-debug

docker: cleanup
	docker build -t swift-server .
	docker run -p 3000:3000 -d -t swift-server:latest

docker-debug: docker
	docker logs --follow $$(docker ps -a -q)

cleanup:
	docker rm -f $$(docker ps -a -q)

clean:
	rm -rfv .build

debug:
	swift build && .build/debug/swift-server
