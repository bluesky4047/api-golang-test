FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o app .

FROM alpine
WORKDIR /root/
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]
