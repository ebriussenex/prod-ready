FROM golang:1.19-alpine as builder

# Set destination for COPY
WORKDIR /usr/src/app

# Download Go modules
COPY go.* ./

RUN go mod download && go mod verify
COPY . .
RUN CGO_ENABLED=0 go build -o /usr/local/bin/app cmd/notes/main.go
# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/engine/reference/builder/#copy
COPY cmd/notes/*.go ./

# Build
FROM alpine:3.16

COPY --from=builder /usr/local/bin/app /app

CMD ["/app"]