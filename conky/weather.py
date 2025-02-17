#!/usr/bin/python3

from datetime import date, timedelta
from urllib.request import urlopen

from bs4 import BeautifulSoup

html_page = urlopen('https://yandex.ru/pogoda/moscow')
soup = BeautifulSoup(html_page, 'html.parser')
today = soup.select_one('.fact__temp .temp__value')
tomorrow = date.today() + timedelta(days=1)
tomorrow_str = tomorrow.strftime('%Y-%m-%d') + ' 00:00+0300'
date_node = soup.select_one('time[datetime="{}"]'.format(tomorrow_str))
tomorrow_node = date_node.parent.select_one(
    '.forecast-briefly__temp_day .temp__value')
# print('{} -> {}'.format(today.text, tomorrow_node.text))
print(
    '${font Ubuntu Mono:size=14:weight=bold}${color2}Today:${color} ${font Ubuntu Mono:size=12}'
    + today.text)
print(
    '${font Ubuntu Mono:size=14:weight=bold}${color2}Tomorrow${color}: ${font Ubuntu Mono:size=12}'
    + tomorrow_node.text)
