

--------------------------------------------------
Git commands:

% Removing local branches

git branch | grep -v "master" | xargs git branch -D 

% Updating submodule

git submodule update --recursive --remote

% Remove release tags
git push --delete origin YOUR_TAG_NAME


--------------------------------------------------
Ubuntu 18.04 tricks
lxappearance
https://askubuntu.com/questions/1030695/how-do-i-get-icons-for-thunar-in-18-04

Cuda 10.0 breaking mouse/keyboard
After installation, re-install the package that it removes (sudo apt-get install xserver-xorg-input)
--------------------------------------------------
$ i3 - Opening settings
env XDG_CURRENT_DESKTOP=GNOME gnome-control-center

--------------------------------------------------
VLC not playing video via sshf
By default, vlc is confined, remove and re-install

```sudo snap remove vlc```

```sudo apt-get install vlc```
