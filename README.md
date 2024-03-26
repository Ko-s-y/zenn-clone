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
