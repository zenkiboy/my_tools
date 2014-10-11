#!/usr/bin/osascript
-- Applescript to launch iterm2 terminals/tabs with configurable:
-- ~ List of commands <cmds>
-- ~ Color <color>
-- ~ Name <name>
-- ~ Transparency <trans>
-- ~ Zoom out <zoomout>
-- ~ Split behavior horizontal(h) or vertical(v) <split> :: (h, v)
--
-- Run from terminal with `osascript` or just ./<<script>>
-- Dont unfocus with the mouse/keyboard while executing. the script.
-- Recomended to go full screen (CMD + Enter) if <zoomout> attributes used.
-- Change myTermWindow and myItem(s) as desired.
--
--
-- Author: Luis Martin Gil http://www.luismartingil.com
-- Year : 2013
--
-- Modified by Mickey Zhang zenkiboy@gmail.com 
-- Year : 2014

-- # python script for the color schema generation
-- rgbs = [(0, 24, 92), (63, 29, 64), (84, 19, 41), (12, 100, 130), (64, 55, 56)]
-- def convert(num):
--     if num < 0: tmp = 0
--     elif num > 255: tmp = 255
--     else: tmp = num
--     return float(tmp*65535)/float(255)

-- all_colors = []

-- for item in rgbs:
--     r,g,b = item
--     delta = 22
--     mods = {'bright':delta, '':0, 'dark':-delta}
--     index = rgbs.index(item)
--     for k,m in mods.iteritems():
--        	color = ('%s%s' % (index, k), convert(r+m), convert(g+m), convert(b+m))
--         all_colors.append(color)

-- for nam,r,g,b in all_colors:
--     print 'set myColor%s to {%s, %s, %s}' % (nam, r, g, b)

set myColor0 to {0.0, 6168.0, 23644.0}
set myColor0dark to {0.0, 514.0, 17990.0}
set myColor0bright to {5654.0, 11822.0, 29298.0}
set myColor1 to {16191.0, 7453.0, 16448.0}
set myColor1dark to {10537.0, 1799.0, 10794.0}
set myColor1bright to {21845.0, 13107.0, 22102.0}
set myColor2 to {21588.0, 4883.0, 10537.0}
set myColor2dark to {15934.0, 0.0, 4883.0}
set myColor2bright to {27242.0, 10537.0, 16191.0}
set myColor3 to {3084.0, 25700.0, 33410.0}
set myColor3dark to {0.0, 20046.0, 27756.0}
set myColor3bright to {8738.0, 31354.0, 39064.0}
set myColor4 to {16448.0, 14135.0, 14392.0}
set myColor4dark to {10794.0, 8481.0, 8738.0}
set myColor4bright to {22102.0, 19789.0, 20046.0}

tell application "iTerm"
activate
	
	-- First tab
	set myItem1 to {}
	set myItem1 to myItem1 & {{color:myColor3dark, cmds:{"ssh -t core1 'sh init/tail.sh php.log'"}, name:"php.log", trans:"0", split:"h", before_split:""}}
	set myItem1 to myItem1 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/tail.sh www-access.log'"}, name:"www-access.log", trans:"0", split:"v", before_split:""}}
	set myItem1 to myItem1 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/tail.sh www-error.log'"}, name:"www-error.log", trans:"0", split:"v", before_split:"]"}}
	set myItem1 to myItem1 & {{color:myColor3dark, cmds:{"ssh -t core1 'sh mysqlconn'"}, name:"", trans:"0", before_split:"" }}

	-- Second tab
	set myItem2 to {}
	set myItem2 to myItem2 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch1.sh'"}, name:"watch1", trans:"0", split:"h", before_split:""}}
	set myItem2 to myItem2 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch2.sh'"}, name:"watch2", trans:"0", split:"n/a", before_split:""}}

	-- Third tab
	set myItem3 to {}
	set myItem3 to myItem3 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch3.sh'"}, name:"watch3", trans:"0", split:"h", before_split:""}}
	set myItem3 to myItem3 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch4.sh'"}, name:"watch4", trans:"0", split:"n/a", before_split:""}}

	-- Forth tab
	set myItem4 to {}
	set myItem4 to myItem4 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch5.sh'"}, name:"watch5", trans:"0", split:"h", before_split:""}}
	set myItem4 to myItem4 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch6.sh'"}, name:"watch6", trans:"0", split:"n/a", before_split:""}}

	-- Fifth tab
	set myItem5 to {}
	set myItem5 to myItem5 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch7.sh'"}, name:"watch7", trans:"0", split:"h", before_split:""}}
	set myItem5 to myItem5 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch8.sh'"}, name:"watch8", trans:"0", split:"n/a", before_split:""}}

	-- Sixth tab
	set myItem6 to {}
	set myItem6 to myItem6 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch9.sh'"}, name:"watch9", trans:"0", split:"h", before_split:""}}
	set myItem6 to myItem6 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch10.sh'"}, name:"watch10", trans:"0", split:"n/a", before_split:""}}

	-- Seventh tab
	set myItem7 to {}
	set myItem7 to myItem7 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch11.sh'"}, name:"watch11", trans:"0", split:"h", before_split:""}}
	set myItem7 to myItem7 & {{color:myColor1dark, cmds:{"ssh -t core1 'sh init/mysqlwatch12.sh'"}, name:"watch12", trans:"0", split:"n/a", before_split:""}}
	
	set myTermWindow to {myItem1, myItem2, myItem3, myItem4, myItem5, myItem6, myItem7}
	
	set myterm to (make new terminal)
	
	tell myterm
    set number of columns to 244
    set number of rows to 73

		repeat with n from 1 to count of myTermWindow
			launch session n
			repeat with i from 1 to count of (item n of myTermWindow)
				-- Some commands might require more columns to be readable
				#delay 0.1
				#repeat zoomout of (item i of (item n of myTermWindow)) times
					#tell i term application "System Events" to keystroke "-" using command down
                        #delay 0.1
				#end repeat
				-- Lets execute the commands for the tab
				#repeat with cmd in cmds of (item i of (item n of myTermWindow))
				#	tell session i to write text cmd
				#end repeat
				-- Split the pane in a "D" (vertical) or "d" (horizontal) way
				delay 0.1

                if "]" is before_split of (item i of (item n of myTermWindow)) then 
                    tell i term application "System Events" to keystroke "]" using command down
                end if

				if i is less than (count of (item n of myTermWindow)) then
					if "h" is split of (item i of (item n of myTermWindow)) then
						set split_str to "D"
					else if "v" is split of (item i of (item n of myTermWindow)) then
						set split_str to "d"
					else
						error
						return
					end if
					tell i term application "System Events" to keystroke split_str using command down
				end if

			end repeat
		end repeat

        set session_cnt to 1
		repeat with n from 1 to count of myTermWindow
			repeat with i from 1 to count of (item n of myTermWindow)
				repeat with cmd in cmds of (item i of (item n of myTermWindow))
                    -- Lets set the properties of the actual tab
                    delay 0.1
                    tell session session_cnt to set name to name of (item i of (item n of myTermWindow))
                    delay 0.1
                    tell session session_cnt to set background color to color of (item i of (item n of myTermWindow))
                    delay 0.1
                    tell session session_cnt to set transparency to trans of (item i of (item n of myTermWindow))
                    delay 0.1
					tell session session_cnt to write text cmd
                    delay 0.1
                    set session_cnt to session_cnt + 1
				end repeat
			end repeat
		end repeat
	end tell
end tell
