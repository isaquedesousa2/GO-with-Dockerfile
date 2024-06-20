FROM golang:latest as builder

WORKDIR /app
COPY . .

RUN go build -o go main.go

FROM scratch
WORKDIR /root/
COPY --from=builder /app/go .
CMD ["./go"]
