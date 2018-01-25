FROM alpine:latest as builder
ENV VERSION 1.2

RUN apk --no-cache add ca-certificates
WORKDIR /root/
ADD https://github.com/bep/s3deploy/releases/download/v${VERSION}/s3deploy_${VERSION}_Linux-64bit.tar.gz s3deploy.tar.gz
RUN tar xvzf s3deploy.tar.gz

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /root/s3deploy /usr/local/bin/s3deploy
