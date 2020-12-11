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
* **nvidia-settings --assign CurrentMetaMode="HDMI-0: nvidia-auto-select +1920+0 {ForceCompositionPipeline=On}"** - second monitor tearing
* **192.168.0.170:/mnt/server   /home/webmalc/pi   nfs    rw  0  0** - fstab
* **options nvidia-drm modeset=1** - /etc/modprobe.d/zz-nvidia-drm-nomodeset.conf
* **background-color: rgba(0, 0, 0, 0.7);** - sudo vim /usr/share/themes/Mint-Y-Dark-Aqua/cinnamon/cinnamon.css - panel-top, .panel-bottom, .panel-left, .panel-right
