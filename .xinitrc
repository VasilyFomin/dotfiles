# setxkbmap -layout us,ru -option 'grp:caps_toggle,grp_led:caps'

# use Alt_L as Mod, but keep using Alt_R
xmodmap -e "remove Mod1 = Alt_R"
xmodmap -e "add Mod3 = Alt_R"
