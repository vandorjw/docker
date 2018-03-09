FROM golang AS build-env

WORKDIR /src
ADD . /src
RUN go get -d -v ./...
RUN cd /src && go build -o goapp

# final stage
FROM scratch
WORKDIR /app
COPY --from=build-env /src/goapp /app/
ENTRYPOINT ./goapp
