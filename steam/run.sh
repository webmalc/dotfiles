#!/bin/bash
current_time=$(date +%H:%M)
if [[ "$current_time" > "18:00" ]] || [[ "$current_time" < "07:00" ]]; then
    /home/webmalc/.config/rofi/scripts/watson.sh
    __NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only steam -window-mode exclusive
else
    notify-send --urgency=critical "[$current_time] Shame on you! You must work until 18:00."
fi
