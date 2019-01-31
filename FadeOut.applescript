-- AppleScript for stop play with Fade Out effect
--
-- @author Andrea Tassotti
-- @date 2019
--
tell application "iTunes"
	
	set step to 5
	if player state is playing then
		repeat while sound volume > 0
			if sound volume < 11 then set step to 1
			if sound volume > 0 then set sound volume to (sound volume - step)
			delay 0.4
		end repeat
	end if
	if player state is playing then stop
end tell

