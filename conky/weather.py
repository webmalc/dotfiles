#!/usr/bin/python3

from urllib.request import urlopen

from bs4 import BeautifulSoup

html_page = urlopen("https://yandex.ru/pogoda/moscow")
soup = BeautifulSoup(html_page, "html.parser")
days = soup.select("span[class^='AppShortForecastDay_temperature__']")
print(
    "${font Ubuntu Mono:size=14:weight=bold}${color2}Today:${color} ${font Ubuntu Mono:size=12}"
    + days[0].text
)
print(
    "${font Ubuntu Mono:size=14:weight=bold}${color2}Tomorrow${color}: ${font Ubuntu Mono:size=12}"
    + days[2].text
)
