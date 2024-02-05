FROM golang:1.21 AS builder
WORKDIR /src
COPY . .
RUN go build -o /go/bin/hello ./hello.go

FROM scratch
COPY --from=builder /go/bin/hello /go/bin/hello
CMD [ "/go/bin/hello" ]