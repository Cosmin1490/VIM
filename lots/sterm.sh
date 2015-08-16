#!/bin/bash
osascript -e "
tell application \"iTerm\"
    activate
    set myterm to (make new terminal)
    tell myterm

	launch session \"Default Session\"
    tell application \"System Events\" to keystroke \"d\" using command down
	launch session \"Default Session\"

	tell application \"System Events\" to key code 126 using command down

	tell item 1 in sessions
    set name to \"LeftPane\"
    write text \"ssh private\"
	end tell

	tell item 2 in sessions
    set name to \"RightPane\"
    write text \"ssh private\"
	end tell

	tell item 3 in sessions
    set name to \"VVIM\"
    write text \"ssh private\"
	end tell

	delay 3

	tell item 1 in sessions
		write text \"$1\"
		write text \"screen -d -R leftPane\"
		delay 1
	end tell

	tell item 2 in sessions
		write text \"$2\"
		write text \"screen -d -R rightPane\"
		delay 1
	end tell

	tell item 3 in sessions
		write text \"$3\"
		write text \"screen -d -R vvim\"
		delay 1
	end tell
    end tell

end tell"
