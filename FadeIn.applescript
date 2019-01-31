tell application "iTunes"
	-- insert actions here
	set step to 5
	set mCurrentPlaylist to view of window 1
	set mPlaylistName to name of mCurrentPlaylist
	set titolo to name of first track of mCurrentPlaylist
	if (count of items of selection of window 1) > 0 then
		set mCurrentSelection to first item of selection of window 1
		set titolo to name of mCurrentSelection
	end if
	if player state is not playing then
		display dialog "Start play of playlist \"" & mPlaylistName & "\" from track \"" & titolo & "\"" buttons {"Play", "Dont"} default button 1
		if the button returned of the result is "Play" then
			set sound volume to 0
			if (count of items of selection of window 1) > 0 then
				play mCurrentSelection
			else
				play mCurrentPlaylist
			end if
			
			repeat while sound volume < 100
				if sound volume > 89 then set step to 1
				if sound volume < 100 then set sound volume to (sound volume + step)
				delay 0.4
			end repeat
			
		end if
	end if
end tell

