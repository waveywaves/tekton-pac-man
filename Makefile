.PHONY: build test clean

# Default build target
build:
	go build -o bin/app main.go

# Run tests
test:
	go test -v ./...

# Clean build artifacts
clean:
	rm -rf bin/

# Run the application
run: build
	./bin/app 