## 共通

- build
```
docker compose build --no-cache
```

- 確認
```
docker compose up -d
```

## FRONTEND

- nextコンテナ
```
docker compose exec next /bin/bash
```

- nextコンテナ内でserver起動
```
npm run dev
```

- npm install
```
docker compose run --rm next npm install
```

- lint
```
docker compose run --rm next npm run lint
```

- lintルール違反自動修正
```
docker compose run --rm next npm run format
```


## BACKEND

- railsコンテナ
```
docker compose exec rails /bin/bash
```

- railsコンテナ内でserver起動
```
rails s -b '0.0.0.0'
```

- bundle install
```
docker compose run --rm rails bundle install
```

- rubocop
```
docker compose run --rm rails rubocop
```

- rubocopルール違反自動修正
```
docker compose run --rm rails rubocop -A
```
