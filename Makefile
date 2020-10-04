######################################################################
# @author      : annika (annika@berlin.ccc.de)
# @file        : Makefile
# @created     : Sunday Aug 16, 2020 19:24:54 CEST
######################################################################

all: pantraserver

pantraserver: build

build:
	cd cmd/pantra_server && go build
	mkdir -p ./bin
	mv cmd/pantra_server/pantra_server ./bin
	chmod 755 bin/pantra_server

.PHONY:
	clean test

run:
	go run cmd/pantra_server/main.go

runbin:
	./bin/pantra_server

test:
	cd pkg/pantra_server/model/expkey && go test -v
	cd pkg/pantra_server/expkeyservice && go test -v

clean:
	rm -f bin/*


