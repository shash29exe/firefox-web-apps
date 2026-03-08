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

---
## Установка иконки в панель задач (X11 ONLY!)  
1. Установка зависимостей
   
### Debian/Ubuntu
```bash
sudo apt install libxmu-headers libgd-dev libxmu-dev libglib2.0-dev
```
    
### EL7
```bash
sudo yum install libXmu-devel gd gd-devel glib2-devel
```
    
### OpenSUSE
```bash
sudo zypper in libXmu-devel glib2-devel gd-devel
```
    
2. Клонирование репозитория
```bash
git clone https://github.com/xeyownt/xseticon
```

3. Компиляция
```bash
cd xseticon && make && sudo cp xseticon /usr/local/bin
```


Bash скрипт
   ```bash
    #!/bin/bash

    URL="https://URL"
    PROFILE_PATH="/home/shash29/.mozilla/firefox/PROFILE"
    ICON_PATH="path to icon"
    TITLE_GREP="window title to grep"

    firefox --no-remote --profile "$PROFILE_PATH" --class "dontchangethis" --new-window "$URL" >/dev/null 2>&1 &

    sleep 3

    WINDOW_ID=$(wmctrl -l | grep -i "$TITLE_GREP" | awk '{print $1}')
    if [ -n "$WINDOW_ID" ]; then
        xseticon -id $WINDOW_ID $ICON_PATH
    else
        sleep 5
        WINDOW_ID=$(wmctrl -l | grep -i "$TITLE_GREP" | awk '{print $1}')
        if [ -n "$WINDOW_ID" ]; then
            xseticon -id $WINDOW_ID $ICON_PATH
        fi
    fi
   ```

  Описание переменных:
  
URL          - URL сайта который откроется в этом профиле

PROFILE PATH - Путь до второго профиля Firefox

ICON_PATH    - Путь до иконки на которую заменится

TITLE_GREP   - Содержимое в заголовке окна для определения его id



Пример готового скрипта:
  ```bash
    #!/bin/bash

    URL="https://vk.com"
    PROFILE_PATH="/home/shash29/.mozilla/firefox/beglofmk.webapps-esr"
    ICON_PATH="/home/shash29/icons/rutracker.png"
    TITLE_GREP="ВКонтакте"

    firefox --no-remote --profile "$PROFILE_PATH" --class "dontchangethis" --new-window "$URL" >/dev/null 2>&1 &

    sleep 3

    WINDOW_ID=$(wmctrl -l | grep -i "$TITLE_GREP" | awk '{print $1}')
    if [ -n "$WINDOW_ID" ]; then
        xseticon -id $WINDOW_ID $ICON_PATH
    else
        sleep 5
        WINDOW_ID=$(wmctrl -l | grep -i "$TITLE_GREP" | awk '{print $1}')
        if [ -n "$WINDOW_ID" ]; then
            xseticon -id $WINDOW_ID $ICON_PATH
        fi
    fi
  ```
