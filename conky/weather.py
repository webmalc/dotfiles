#!/usr/bin/python

import urllib2
from datetime import date, timedelta

from bs4 import BeautifulSoup

html_page = urllib2.urlopen('https://yandex.ru/pogoda/moscow')
soup = BeautifulSoup(html_page, 'html.parser')
today = soup.select_one('.temp__value')
tomorrow = date.today() + timedelta(days=1)
tomorrow_str = tomorrow.strftime('%Y-%m-%d') + ' 00:00+0300'
date_node = soup.select_one('time[datetime="{}"]'.format(tomorrow_str))
tomorrow_node = date_node.parent.select_one(
    '.forecast-briefly__temp_day .temp__value')
# print('{} -> {}'.format(today.text, tomorrow_node.text))
print('Today: ' + today.text)
print('Tomorrow: ' + tomorrow_node.text)
