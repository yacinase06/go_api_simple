FROM golang:1.13-alpine3.11
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go get -u github.com/gorilla/mux
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
CMD ["/app/main"]