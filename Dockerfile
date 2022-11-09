FROM golang AS builder

WORKDIR /app

RUN go mod init myapp

COPY src/. .

RUN go build -o myapp .

# deployment image
FROM scratch

WORKDIR /app

COPY --from=builder /app/myapp .

CMD [ "./myapp" ]
