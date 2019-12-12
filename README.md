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
$ docker run -d --rm -p 8091:7658 --name solargraph vscode-solargraph
```

If you want to specify the ruby version, let's specify it with arg as follows

```bash
$ docker run -d --rm -p 8091:7658 --name solargraph --build-arg RUBY_VERSION="x.x.x" vscode-solargraph
```

If you want to specify the alpine version, let's specify it with arg as follows

```
$ docker run -d --rm -p 8091:7658 --name solargraph --build-arg ALPINE_VERSION="x.x" vscode-solargraph
```

3. Setup Visual Studio

- Install [VSCode Solargraph Extension](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph)
- Add the following to settings.json

```json
"solargraph.transport": "external",
"solargraph.externalServer": {
    "host": "localhost",
    "port": 8091
}
```
