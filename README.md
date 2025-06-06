# README
**環境構築**

1.初期必須ファイルの作成

- Dockerfile
```
FROM ruby:3.2.3

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get update -qq && \
    apt-get install -y nodejs yarn postgresql-client build-essential

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
```

- docker-compose.yml
```
version: '3.9'
services:
  web:
    build: .
    command: bash -c "rm -f tmp/pids/server.pid && bin/dev"
    volumes:
      - .:/app
    ports:
      - "3000:3000"
    depends_on:
      - db

  db:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: password
    volumes:
      - db_data:/var/lib/postgresql/data

volumes:
  db_data:
```

- Gemfile
```
source 'https://rubygems.org'
ruby '3.2.3'
gem 'rails', '~> 7.2.1'
```

- Gemfile

2.Railsプロジェクトの初期化
```
docker compose build
docker compose run web rails new . --force --no-deps --database=postgresql
```

3.DB設定を編集
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: app_development

test:
  <<: *default
  database: app_test

production:
  <<: *default
  database: app_production
  username: app
  password: <%= ENV["APP_DATABASE_PASSWORD"] %>
```

4.docker-compose.yml を以下に書き換える
```
services:
  web:
    build: .
    command: bash -c "rm -f tmp/pids/server.pid && bin/dev"
    volumes:
      - .:/app
    ports:
      - "3000:3000"
    depends_on:
      - db
    environment:
      RAILS_ENV: development

  db:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: password
    volumes:
      - db_data:/var/lib/postgresql/data

volumes:
  db_data:
```

5.データベースの作成、マイグレーション(別ターミナルでdocker compose up)
```
docker compose exec web bin/rails db:create
docker compose exec web bin/rails db:migrate
```

6.localhost:3000にアクセス
  