# VoltMobi test app
[![Build Status](https://travis-ci.org/PeoneEr/volt.svg?branch=master)](https://travis-ci.org/PeoneEr/volt)

## Для запуска необходимы ruby >= 2.3

```
bundle install
bundle exec rails db:create db:migrate db:seed
bundle exec rspec .

open coverage/index.html
```

## После выполнения db:seed появится информация об администраторе
