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
