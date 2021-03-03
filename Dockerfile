FROM golang:1.7.3 as builder

WORKDIR /go/src/desafio
COPY . .

RUN go get ./
RUN go build -ldflags "-s -w" -o /go/bin/desafio

FROM scratch
COPY --from=builder /go/bin/desafio /go/bin/desafio
CMD chmod +x /go/bin/desafio
ENTRYPOINT ["/go/bin/desafio"]