FROM golang:alpine as build
ENV GO111MODULE=on
ENV CGO_ENABLED=0
ENV GOOS=linux

RUN apk add --no-cache make git

WORKDIR /go/src/github.com/sampx/gotrue
COPY . /go/src/github.com/sampx/gotrue

RUN make deps build
RUN go build -a -installsuffix cgo -o gotrue


FROM alpine:3.7
RUN adduser -D -u 1000 gotrue

RUN apk add --no-cache ca-certificates
COPY --from=build /go/src/github.com/sampx/gotrue/gotrue /usr/local/bin/gotrue
COPY --from=build /go/src/github.com/sampx/gotrue/migrations /usr/local/etc/gotrue/migrations/

ENV GOTRUE_DB_MIGRATIONS_PATH /usr/local/etc/gotrue/migrations

USER gotrue
CMD ["gotrue"]