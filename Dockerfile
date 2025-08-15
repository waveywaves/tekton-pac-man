FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o /app/bin/app main.go

FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/bin/app .

EXPOSE 8080
CMD ["./app"] 