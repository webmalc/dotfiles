#!/usr/bin/python

import textwrap
import urllib2

from bs4 import BeautifulSoup

html_page = urllib2.urlopen('https://slashdot.org/popular')
soup = BeautifulSoup(html_page, 'html.parser')
items = soup.select('.story-title')[:7]
for item in items:
    print(textwrap.fill(item.text.strip(), 30))
    print(' ')
