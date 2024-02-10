Lenovo Dual boot

    - Disk Managemenet -> Create empty partition for Ubuntu

    - First disable BitLocker on windows
        Settings -> Privacy and Security -> Device encryption : Off

    - Go to BIOS setting and enable usb booting, F1 and disable Secure Boot



Lenovo i3 Tweaks

    - Brightness install
        sudo apt update 
        sudo apt install brightnessctl
        sudo usermod -aG video $USER

    - Mouse cursor too big
        Add the following line to your ~/.Xresources or ~/.Xdefaults file to set the cursor size:
            Xcursor.size: 24

    - Screen Resolution
        /home/melissa/.config/resolution.sh

    - Terminator transparent background
        sudo apt update
        sudo apt install picom

        inside i3 config -> 3exec --no-startup-id picom -b

    - Terminal error when opening from folder
        sudo apt install xfce4-settings

    

