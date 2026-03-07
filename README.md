# Firefox web apps
## Инструкция
1. В firefox заходим на `about:profiles` и создаём профиль с любым именем (например, webapps-esr). Если второй профиль стал "по умолчанию", то у основного профиля нажмите "установить как профиль по умолчанию".
2. Запустите второй профиль нажатием кнопки "Запустить ещё один браузер с этим профилем".
3. Во втором профиле переходим в `about:config` и соглашаемся с риском.
4. В поиске пишем `toolkit.legacyUserProfileCustomizations.stylesheets` и двойным щелчком выставляем значение true.
5. Переходим в `/home/ИМЯПОЛЬЗОВАТЕЛЯ/.mozilla/firefox/` и в этой директории находим директорию с названием второго профиля (например, "beglofmk.webapps-esr").
6. В директории второго профиля создаём директорию с названием `chrome` и в ней файл `userChrome.css`.
7. В файл userChrome.css помещаем содержимое [из файла в репозитории](https://github.com/shash29exe/firefox-web-apps/blob/main/userChrome.css).
8. Закрываем второй профиль.

## Использование
Открыть сайт в этом профиле можно командой
```bash
firefox --profile "/home/ИМЯПОЛЬЗОВАТЕЛЯ/.mozilla/firefox/ПРОФИЛЬ" example.com
```

## Скриншот
![](https://raw.githubusercontent.com/shash29exe/firefox-web-apps/refs/heads/main/img/image.png)
