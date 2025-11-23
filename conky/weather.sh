#!/bin/bash
rm /tmp/conky_weather.png
curl "wttr.in/Москва_0Qt.png" >>/tmp/conky_weather.png
convert -transparent black /tmp/conky_weather.png /tmp/conky_weather.png
