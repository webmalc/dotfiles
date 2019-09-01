#!/usr/bin/python
import textwrap
import urllib2

from bs4 import BeautifulSoup

html_page = urllib2.urlopen('https://www.vocabulary.com/dictionary/randomword')
soup = BeautifulSoup(html_page, 'html.parser')
word = soup.select_one('h1.dynamictext').text
word = '${font Ubuntu Mono:size=16}' + word.capitalize()
text = soup.select_one('p.short').text
text = '${font Ubuntu Mono:size=12}' + textwrap.fill(text, 30)
result = u'{}\n\n{}'.format(word, text)

print(result.encode('utf-8'))
