Config { font    = "xft:JetBrains Mono:weight=bold:size=10:antialias=true:hinting=true,Noto Sans Bengali:weight=bold:size=10:antialias=true:hinting=true"
       , additionalFonts = [ "xft:Symbols Nerd Font:size=10:antialias=true:hinting=true"
--                           , "xft:FontAwesome:size=10"
                           ]
--       , borderColor = "black"
--       , border = TopB
       , bgColor = "#282c34"
       , fgColor = "#d8dee9"
       , alpha = 255
       , position = Static { xpos = 0 , ypos = 0, width = 1920, height = 24 }
--       , textOffset = -1
--       , iconOffset = -1
       , lowerOnStart = True
--       , pickBroadest = False
       , persistent = True
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
--       , overrideRedirect = True
       , commands = [ Run Network "wlp0s20u3" ["-t", "<fn=1>\xf063</fn> <rx>kb  <fn=1>\xf062</fn> <tx>kb",
       			       "-L","0","-H","131072","--normal",
			       "#ff6c6b","--high","#98be65"] 20
                    , Run Cpu ["-t","<fn=1>\xf108</fn> Cpu: <total>%",
		    	       "-L","3","-H","50",
                               "--normal","#98be65","--high","#ff6c6b"] 20
                    , Run Memory ["-t","<fn=1>\xf233</fn> Mem: <usedratio>%"] 30
--                    , Run Swap [] 10
--                    , Run Com "uname" ["-s","-r"] "" 36000
                    , Run Date "<fn=1>\xf133</fn> %a %d-%m-%Y %l:%M %p" "date" 50
		    , Run StdinReader
		    -- trayer padding icon
		    , Run Com "/home/atif/.config/xmonad/scripts/trayer-padding-icon.sh" [] "trayerpad" 10
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %StdinReader% }{ \
       		    \<fc=#ecbe7b>%cpu%</fc> <fc=#434c5e>|</fc> \
		    \<fc=#ff6c6b>%memory%</fc> <fc=#434c5e>|</fc> \
		    \<fc=#51afef>%wlp0s20u3%</fc> <fc=#434c5e>|</fc> \
		    \<fc=#c678dd>%date%</fc> <fc=#434c5e>|</fc>%trayerpad%"
       }
