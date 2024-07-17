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
