# Docker

<pre>Docker is an open source platform that enables developers to build, deploy, run, update and manage containerized applications.</pre>

## Commands

+ shows currently running containers

    ```bash
    docker ps
    ```

+ shows all containers

    ```bash
    docker ps -a
    ```

+ to build the image with a tag

    ```bash
    docker build -t <tag> <loc>
    ```

  + -t indicates tag
  + < loc > is the location of dockerfile

+ to run the image

    ```bash
    docker run -p <lport>:<cport> <tag>
    ```

  + -p indicates linking the containers' port to local port

+ to pull the in-built image

    ```bash
    docker pull <image-name>
    ```

  + -p indicates linking the containers' port to local port

## Dockerfile

```Dockerfile
# Start with a base image containing Go runtime
FROM golang:latest

# Set the Current Working Directory inside the container
WORKDIR /go/src/app

# Copy everything from the current directory to the PWD (Present Working Directory) inside the container
COPY . .

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Build the Go app
RUN go build -o main .

# Expose port 8080 to the outside world
EXPOSE 8180

# Command to run the executable
CMD ["./main"]

```

<pre>
ENTRYPOINT & CMD --> used for commands; entrypoint is startup command & cmd is appended to it if no command is given in command-line (like default)
</pre>
