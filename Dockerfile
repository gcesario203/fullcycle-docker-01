FROM golang:alpine as build

WORKDIR /app

COPY fullcycle-rocks.go /app/

RUN go build fullcycle-rocks.go && \
    rm fullcycle-rocks.go

FROM scratch as final

WORKDIR /app

COPY --from=build /app/fullcycle-rocks /app/

ENTRYPOINT [ "./fullcycle-rocks" ]