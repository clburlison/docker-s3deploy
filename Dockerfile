FROM golang:alpine as builder

RUN apk --no-cache add ca-certificates
RUN apk update
RUN apk upgrade
RUN apk add --no-cache git
WORKDIR /root/
RUN go get -v github.com/bep/s3deploy
RUN which s3deploy

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /go/bin/s3deploy /usr/local/bin/s3deploy
