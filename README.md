# go-production-boilerplate
This is a web application boilerplate built with golang for production.
This is more like a memo, so I don't guarantee it will work.

# Build a local environment
`cp .env_example .env`

```
make docker-compose-build
make docker-compose-up
```

# Deploy
If you haven't create a docker host, you need to create a docker host.

`sh -x create_docker_machine.sh`

You can deploy by using this command.
`make deploy`

# Reference
- [Docker MachineでMacからVPS上のDockerへアプリをデプロイしよう](https://qiita.com/momotaro98/items/5b902afea3530b6f0b93)
