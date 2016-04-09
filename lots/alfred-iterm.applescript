on alfred_script(q)
	if application "iTerm" is running then
		run script "
			on run {q}
				tell application \":Applications:iTerm.app\"
					activate
					try
						set myterm to the first terminal
					on error
						set myterm to (make new terminal)
					end try
					tell myterm
						set mysession to (launch session \"Default Session\")
						tell mysession to write text q
					end tell
				end tell
			end run
		" with parameters {q}
	else
		run script "
			on run {q}
				tell application \":Applications:iTerm.app\"
					activate
					tell the first terminal
						tell the last session to write text q
					end tell
				end tell
			end run
		" with parameters {q}
	end if
end alfred_script
