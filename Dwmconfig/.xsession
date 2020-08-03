#!/usr/bin/sh
#

# @Parallelized
# Emacs Daemon setup
emacs --daemon &

# @PermanentThread
# DWMblocks (status bar) setup (Permanent thread)
dwmblocks_loop &

# @PermenentThread
# Dropbox initialize
dropbox &

# @Instant
# Background
feh .Util/Backgrounds/PixelGoldenHourDracula.png --bg-fill --image-bg '#282a36'

# @Instant
# TODO Change this to future script handler and Systemd
xrandr --output HDMI-1 --mode 1920x1080

# @Instant
# Set keyboard layout to english Intl. with dead keys
setxkbmap -layout us -variant intl
