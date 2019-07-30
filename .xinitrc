#!/bin/sh


userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# export GDK_SCALE=2
# export GDK_DPI_SCALE=01

### Enable Optimus support in NVIDIA proprietary driver

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
# Uncomment if DPI is not properly detected
# xrandr --dpi 96


### Merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi


### Configure some things

# Add fonts directory
xset +fp /usr/share/fonts/TTF/
xset fp rehash


### Start some nice programs

# Open i3 window manager
exec i3 --shmlog-size=26214400
