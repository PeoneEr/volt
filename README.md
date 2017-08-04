# VoltMobi test app

## Для запуска необходимы ruby >= 2.3

```
bundle install
bundle exec rails db:create db:migrate db:seed
bundle exec rspec .

open coverage/index.html
```
