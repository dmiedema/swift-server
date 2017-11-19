.PHONY: docker clean debug cleanup

docker:
	docker build -t swift-server .
	docker run -p 3000:3000 -d -t swift-server:latest

cleanup:
	docker rm -f $$(docker ps -a -q)

clean:
	rm -rfv .build

debug:
	swift build && .build/debug/swift-server
