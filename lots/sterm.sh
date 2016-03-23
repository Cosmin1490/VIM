#!/bin/bash
osascript -e "
tell application \"iTerm\"
  activate
  set myterm to (make new terminal)
  tell myterm

    tell application \"System Events\" to key code 126 using command down

    launch session \"Default Session\"
    delay 0.1

    launch session \"Default Session\"
    tell application \"System Events\" to keystroke \"d\" using command down
    tell application \"System Events\" to keystroke \"d\" using command down
    delay 0.1

    launch session \"Default Session\"
    delay 0.1

    tell item 1 in sessions
      set name to \"UI Vim\"
    end tell

    tell item 2 in sessions
      set name to \"Scripts\"
    end tell

    tell item 3 in sessions
      set name to \"Server\"
    end tell

    tell item 4 in sessions
      set name to \"Grunt\"
    end tell

    tell item 5 in sessions
      set name to \"Git\"
    end tell

    delay 1

    tell item 1 in sessions
      activate
      write text \"cd ~/code/projectxxx/projectxxx-web-app\"
      write text \"vvim\"
      delay 0.1
    end tell

    tell item 2 in sessions
      write text \"cd ~/code/projectxxx/projectxxx-web-server\"
      delay 0.1
    end tell

    tell item 3 in sessions
      write text \"cd ~/code/projectxxx\"
      delay 0.1
    end tell

    tell item 4 in sessions
      write text \"cd ~/code/projectxxx/projectxxx-web-app\"
      delay 0.1
    end tell

    tell item 5 in sessions
      write text \"cd ~/code/projectxxx\"
      delay 0.1
    end tell

  end tell

end tell"
