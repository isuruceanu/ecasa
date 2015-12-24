# golang image where workspace (GOPATH) configured at /go.
FROM golang:latest

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/isuruceanu/ecasa/tree/master/ecasa.web

# Build the golang-docker command inside the container.
RUN go install github.com/isuruceanu/ecasa/tree/master/ecasa.web

# Run the golang-docker command by default when the container starts.
ENTRYPOINT /go/bin/ecasa.web

# http server listens on port 8080.
EXPOSE 8080