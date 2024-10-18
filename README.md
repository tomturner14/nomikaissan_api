# README

## How to build rails on docker

イメージをビルドする

```bash
docker-compose build
```

コンテナを起動する

```bash
docker-compose up -d
```

コンテナを停止する

```bash
docker-compose down
```

コンテナを再起動する

```bash
docker-compose restart
```

rails コンテナに入る

```bash
docker-compose exec web bash
```

db コンテナに入る

```bash
docker-compose exec db bash
```

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
