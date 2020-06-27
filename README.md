Dotfiles for Mint
=================

* **sudo ./install -c root.conf.yaml** - install the root packages and links
* **./install -c packages.conf.yaml** - install the no-root packages and links 
* **./install** - regular install
* **dconf dump /org/cinnamon/ > dconf/config.ini** - save cinnamon configs
* **nmcli con up id vpn** - connect the VPN connection
* **/home/webmalc/Projects/dotfiles/conky/conky[_work].sh** - conky
* **bash -c "mpv http://host:port >> /dev/null 2>&1 &"** - mbv
* **rofi -no-lazy-grab -show combi -theme themes/appsmenu.rasi** - rofi
* **0 12 * * * /home/webmalc/Projects/dotfiles/task/notifications.py** - crontab
* **nvidia-settings --assign CurrentMetaMode="HDMI-0: nvidia-auto-select +1920+0 {ForceCompositionPipeline=On}"** - second monitor tearing
* **192.168.0.170:/mnt/server   /home/webmalc/pi   nfs    rw  0  0** - fstab




