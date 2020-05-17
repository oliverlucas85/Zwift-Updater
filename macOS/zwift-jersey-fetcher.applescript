###############################################################
##        _._
##       /_ _`.      (c) 2020, David A. Desrosiers
##       (.(.)|      setuid at gmail dot com
##       |\_/'|
##       )____`\     Zwift Jersey Fetcher
##      //_V _\ \
##     ((  |  `(_)   If you find this useful, please drop me
##    / \> '   / \   an email, or send me bug reports if you
##    \  \.__./  /   find any problems with it.
##     `-'    `-'
##
###############################################################
on run {input, parameters}
	set zapp to "Zwift Jersey Fetcher v1.2 by David A. Desrosiers"
	set zconfirm to "Welcome to Zwift Jersey Fetcher!

Are you ready to fill up your closet with ALL of the public Zwift jerseys?"
	display dialog zconfirm with title zapp buttons {"Cancel", "Continue"} default button 1 with icon file ((path to desktop as text) & "icon.icns")
	set zj to "https://raw.githubusercontent.com/desrod/zwift-jersey-fetcher/master/promo-codes.zhq"
	tell application "System Events" to tell process "ZwiftApp"
		set frontmost to true
		windows where title contains "Zwift"
		if result is not {} then perform action "AXRaise" of item 1 of result
		set zurl to do shell script "curl --compressed " & zj
		set zjerseys to paragraphs of zurl
		set znum to the number of paragraphs of zurl
		say "[[rate 180]] Now loading up your closet with" & znum & "Zwift jerseys!" using "Daniel"
		repeat with jersey in zjerseys
			keystroke "P"
			keystroke jersey
			delay 0.5
			keystroke return
		end repeat
	end tell
end run