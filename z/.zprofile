# Status Bar

# Screenkey applet (this will break everything)
# screenkey --start-disabled

# remap caps to escape
setxkbmap -option caps:escape
# swap escape and caps
# setxkbmap -option caps:swapescape

# load Xresources
xrdb ~/.Xresources

# zsh config dir
export ZDOTDIR=$HOME/.config/zsh
