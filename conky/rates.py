#!/usr/bin/python3
import json
from urllib.request import urlopen

response = urlopen("https://www.cbr-xml-daily.ru/daily_json.js")
data = json.load(response)
previous = data["Valute"]["USD"]["Previous"]
value = data["Valute"]["USD"]["Value"]
print(
    "${font Ubuntu Mono:size=14:weight=bold}${color2}USD${color}: ${font Ubuntu Mono:size=12}"
    + "{} / {}".format(value, previous)
)
