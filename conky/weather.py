#!/usr/bin/python

import urllib2

from bs4 import BeautifulSoup

html_page = urllib2.urlopen('https://yandex.ru/pogoda/moscow')
soup = BeautifulSoup(html_page, 'html.parser')
today = soup.select_one('.temp__value')
print(today.text)
