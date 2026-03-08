#!/usr/bin/python3

from urllib.request import urlopen
from datetime import datetime, timedelta

from bs4 import BeautifulSoup

html_page = urlopen("https://www.gismeteo.ru/weather-mytishchi-11441/")
soup = BeautifulSoup(html_page, "html.parser")
days = soup.select("temperature-value")
tomorrow = datetime.now() + timedelta(days=1)
print(
    "${font Ubuntu Mono:size=14:weight=bold}${color2}Now:${color} ${font Ubuntu Mono:size=12}"
    + days[0].get("value")
    + "/"
    + days[1].get("value")
    + "°C"
)
print(
    "${font Ubuntu Mono:size=14:weight=bold}${color2}Today${color}: ${font Ubuntu Mono:size=12}"
    + days[2].get("value")
    + "/"
    + days[3].get("value")
    + "°C"
)
print(
    "${font Ubuntu Mono:size=14:weight=bold}${color2}"
    + tomorrow.strftime("%A")
    + "${color}: ${font Ubuntu Mono:size=12}"
    + days[4].get("value")
    + "/"
    + days[5].get("value")
    + "°C"
)
