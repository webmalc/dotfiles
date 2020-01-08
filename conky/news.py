#!/usr/bin/python

import textwrap
import urllib2

from bs4 import BeautifulSoup

html_page = urllib2.urlopen('https://slashdot.org/popular')
soup = BeautifulSoup(html_page, 'html.parser')
items = soup.select('.story-title')[:5]
print('${font Ubuntu Mono:size=16}Slashdot${font Ubuntu Mono:size=12}')
print(' ')
for item in items:
    print(textwrap.fill(
        item.text.encode('utf-8').replace('$', '$$').strip(), 30))
    print(' ')

html_page = urllib2.urlopen('https://habr.com/ru/top/')
soup = BeautifulSoup(html_page, 'html.parser')
items = soup.select('#broadcast_most-read a.post-info__title')[:7]
print('$hr')
print(' ')
print('${font Ubuntu Mono:size=16}Habr${font Ubuntu Mono:size=12}')
print(' ')
for item in items:
    print(textwrap.fill(
        item.text.encode('utf-8').strip().replace('$', '$$'), 60))
    print(' ')
