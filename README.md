Создатель событий
============
Веб-приложение для создания событий.
В современном мире в связи с большим количеством событий мы забываем о встречах с друзьями,
но это приложение позволит вам исправить досадное недоразумение.
Придумайте событие, создайте его и позовите друзей!
Вы сможете также обсудить его  в комментариях, добавить фотографии.
Событие не для всех? Поставьте на него пароль!
Приложение также отправит письма при следующих событиях:
- Добавлен новый комментарий в событии.
- Добавлено новое фото в событии.
- Добавлена новая подписка в событии.

Рабочий вариант: https://ascending.fun

![alt_text](https://i.ibb.co/VxYv2QL/image.png)

Требования
----------------------------------
Установленный интепретатор Ruby. (точно работает на ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-linux]).

Установленные пакеты imagemagick и libmagickwand-dev.

Придуманные события.
Друзья, с которыми вы хотите встретится.

Потестировать
----------------------------------
1. Склонируйте
2. Сделайте bundle
```
bundle config set --local without 'production'
bundle
```
Первая команда, кстати, запишет параметры bundle в .bundle/config

3. Установите библиотеки imagemagick (пример для Debian/Ubuntu):
```
sudo apt-get install libmagickwand-dev imagemagick
```
   
4. Дополните rails-credentials ключами, вот пример:
```
development:
  mail_sender: no@mail.ru
  action_mailer_default_url: localhost
  mailjet:
    password: 7ce05b64b3419a9a8904dfa85444face
    email_sender: example@mail.ru
    username: 78f2f0e444a12ea80123b6a02843218a
  aws:
    access_key: AKIA2CAD1JLZMP42AGVA
    bucket_name: mybucketname
    secret_key: 1eJ4AwB8RNl2pUVC2sQKKaABggEceYQHPCIb3FaP
  facebook:
    app_id: 293403645867573
    app_secret: d948c3f5c6dc2123670350bb201db3g1
  vk:
    app_id: 3401901
    app_secret: reRnYULUOd2dcaWD2edB
  ymaps:
    key: ba9753g9-922a-431a-79a1-ad541c5412b3
```
mail_sender: почта отправителя для ActionMailer.

mailjet(сервис отправки писем): https://www.mailjet.com/, зарегистрировать добавить адрес отправителя,
получить ключи в разделе конфигурации.

aws(вебсервисы amazon, в данном случае AWS-S3 облачное хранилище): https://aws.amazon.com/ru/s3,
зарегистрироваться добавить bucket.

facebook и vk: добавить приложения для web-login. 

ymaps(карты яндекс): зарегистрировать и получить ключ (https://yandex.ru/dev/maps/jsapi/doc/2.1/quick-start/index.html#get-api-key)

Для production или test аналогичные группы с теми же ключами.

Внимание в development не выполняется отправка почты! Используется гем letter_opener.

5. Соберите webpacker или запустите webpacker-dev-server:
```
bundle exec rails webpacker:install
# или 
bin/webpack-dev-server
```

6. Сделайте миграции:
``` 
rails db:migrate
```

7. Запустите сервер:
```
bundle exec rails s
```

8. Откройте приложение в браузере по адресу http://localhost:3000

Используемые технологии
----------------------------------
Webpacker для статических файлов и js.

Devise: аутентикация.

Pundit: авторизация.

Mailjet: Отправка почты.

Carrierwave + rmagic: сохранение в облаке картинок и аватар.

Omniauth, Omniauth-facebook, Omniauth-vkontakte: OAuth2 авторизация для соответствующих соц. сетей.

Resque + Redis: фоновые задачи отправки писем.

Локализация: i18n

CSS-framework: bootstrap5.0

Галерея для photo: lightbox.


Рабочий вариант размещен на сервере при помощи Capistrano.
На сервере используется Postgres.
Приложение работает на связке nginx + Passenger.


Модификации и распространение
----------------------------------
Приложение предоставляется как есть, без каких-либо ограничений в использовании и модификации.
