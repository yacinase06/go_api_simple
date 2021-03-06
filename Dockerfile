FROM golang:1.15.8-alpine AS build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o ./bin/go-api-simple ./pkg/main.go

FROM scratch AS bin
COPY --from=build /app/bin/go-api-simple /bin/go-api-simple
ENTRYPOINT ["/bin/go-api-simple"]