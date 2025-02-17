Dotfiles for Mint
=================

* **sudo ./install -c root.conf.yaml** - install the root packages and links
* **./install -c packages.conf.yaml** - install the no-root packages and links
* **./install** - regular install
* **dconf dump /org/cinnamon/ > dconf/config.ini** - save cinnamon configs
* **nmcli con up id vpn** - connect the VPN connection
* **/home/webmalc/Projects/dotfiles/conky/conky[_work].sh** - conky
* **bash -c "mpv http://host:port >> /dev/null 2>&1 &"** - mpv
* **rofi -no-lazy-grab -show combi -theme themes/appsmenu.rasi** - rofi
* **0 12 * * * /home/webmalc/Projects/dotfiles/task/notifications.py** - crontab
* **nvidia-settings --assign CurrentMetaMode="DP-1: nvidia-auto-select +0+0 {ForceCompositionPipeline=On}, HDMI-0: nvidia-auto-select +1920+0 {ForceCompositionPipeline=On}"** - monitor tearing
* **192.168.0.170:/mnt/server   /home/webmalc/pi   nfs    rw  0  0** - fstab
* **options nvidia-drm modeset=1** - /etc/modprobe.d/zz-nvidia-drm-nomodeset.conf
* **.panel-top background-color: rgba(0, 0, 0, 0.7); remove box-shadow** - sudo vim /usr/share/themes/Mint-Y-Dark-Aqua/cinnamon/cinnamon.css
* **deezer arl** - cookies
* **mangohud** - MANGOHUD_CONFIG=no_display,cpu_temp,gpu_temp,fps_limit=60 mangohud %command%
* **crontab -e**

57 * * * * XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send --urgency=critical "Stand up and move!!!"              
57 * * * * XDG_RUNTIME_DIR=/run/user/$(id -u) paplay --volume=35536 /home/webmalc/Projects/dotfiles/sounds/active
58 * * * * XDG_RUNTIME_DIR=/run/user/$(id -u) paplay --volume=45536 /home/webmalc/Projects/dotfiles/sounds/active
59 * * * * XDG_RUNTIME_DIR=/run/user/$(id -u) paplay --volume=65536 /home/webmalc/Projects/dotfiles/sounds/active
