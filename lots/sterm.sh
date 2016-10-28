#!/bin/bash
osascript -e "
tell application \"iTerm\"
  activate
  set myterm to (create window with default profile)

  tell myterm

    tell application \"System Events\" to key code 126 using command down

    tell current session of myterm
      set name to \"UI Vim\"
      write text \"cd ~/code/lime\"
      write text \"vvim\"
      delay 0.1
    end tell

    create tab with default profile

    tell current session of myterm
      set name to \"Scripts\"
      write text \"cd ~/code/lime\"
      select (split vertically with default profile)
    end tell

    tell current session of myterm
      set name to \"Server\"
      write text \"cd ~/code/lime\"
      select (split vertically with default profile)
    end tell

    tell current session of myterm
      set name to \"Grunt\"
      write text \"cd ~/code/lime\"
    end tell

    create tab with default profile

    tell current session of myterm
      set name to \"Git\"
      write text \"cd ~/code/lime\"
    end tell

  end tell

end tell"
