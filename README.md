### Getting Started

1. Clone Repository `git@github.com:ttatro32690/software-engineering-docs.git`
2. [Install Docker](https://docs.docker.com/install/)
3. Open settings within Docker Desktop under the `Resources` folder, `File Sharing` and set the drive that the repository is cloned to as the shared drive.
4. Launch operating system command line.
5. Navigate to cloned repository top level directory.
6. Run `docker build -t technical-documentation .`
7. Run `docker run -v $PWD/docs:/docs -p 8080:8080 technical-documentation`
8. Launch [localhost](http://127.0.0.1:8080)

### Stopping Container

1. Ctrl^C out of the watch process on command line.
2. Run `docker ps`
3. Copy `CONTAINER ID`
3. Run `docker stop <CONTAINER ID>`