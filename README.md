# solargraph-docker

docker container of solargraph server for Visual Studio Code

## Requirement

Install the docker engine in a way that suits your execution environment.
[Docker Engine](https://hub.docker.com/search/?offering=community&type=edition)

## Setup

1. Build docker image

```bash
$ cp YOUR_PROJECT_FOLDER/Gemfile YOUR_PROJECT_FOLDER/Gemfile.lock .
$ docker build -t vscode-solargraph:latest .
```

2. Start docker container

```bash
$ docker run -d -p 8091:7658 --name solargraph --rm vscode-solargraph
```

3. Setup Visual Studio

- Install [VSCode Solargraph Extension](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph)
- Add the following to settings.json

```json
"socket.transport": "external",
"socket.externalServer": {
    "host": "localhost",
    "port": 8091
}
```
