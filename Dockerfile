FROM golang:alpine AS build

WORKDIR /

COPY main.go .

RUN go build -o /full-cycle main.go

FROM scratch

WORKDIR /

COPY --from=build /full-cycle /full-cycle

ENTRYPOINT ["/full-cycle"]
