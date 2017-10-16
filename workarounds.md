Ubuntu 16.04 brightness for dell xp
1. Make sure its there : ls /sys/class/backlight/ -> intel_backlight
2. sudo vim /usr/share/X11/xorg.conf.d/20-intel.conf
3. Paste-> Section "Device" Identifier "card0" Driver "intel" Option "Backlight" "intel_backlight" BusID "PCI:0:2:0" EndSection



Ubuntu stop x
Ctrl + Alt + F1 + Fn



--------------------------------------------------
Git commands:

% Removing local branches

git branch | grep -v "master" | xargs git branch -D 

% Updating submodule

git submodule update --recursive --remote
