.PHONY: build test clean lint-go

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

# Lint Go code
lint-go:
	if command -v golangci-lint >/dev/null 2>&1; then \
		golangci-lint run ./...; \
	else \
		echo "golangci-lint not installed, skipping linting"; \
		exit 0; \
	fi 