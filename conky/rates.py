#!/usr/bin/python2

import json

import urllib2

response = urllib2.urlopen("https://www.cbr-xml-daily.ru/daily_json.js")
data = json.load(response)
previous = data["Valute"]["USD"]["Previous"]
value = data["Valute"]["USD"]["Value"]
print(
    "USD: ${font Ubuntu Mono:size=12}"
    + "{} / {}".format(value, previous)
    + "${font Ubuntu Mono:size=16}"
)
