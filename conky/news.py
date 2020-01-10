#!/usr/bin/python

import textwrap
import urllib2
import sys

LEFT = len(sys.argv) > 1

from bs4 import BeautifulSoup

def print_news(url, title, selector, num, wrap=30, hr=False):
    """
    Print news
    """
    html_page = urllib2.urlopen(url)
    soup = BeautifulSoup(html_page, 'html.parser')
    items = soup.select(selector)[:num]
    title_str = '${font Ubuntu Mono:size=16}'
    title_str += title + '${font Ubuntu Mono:size=12}'
    if hr:
        print('$hr')
        print(' ')
    print(title_str)
    print(' ')
    for item in items:
        print(textwrap.fill(
            item.text.encode('utf-8').replace('$', '$$').strip(), wrap))
        print(' ')


if not LEFT:
    print_news(
        'https://slashdot.org/popular',
        'Slashdot',
        '.story-title',
        5,
    )
    print_news(
        'https://habr.com/ru/top/',
        'Habr',
        '#broadcast_most-read a.post-info__title',
        7,
        60,
        True,
    )
else:
    print_news(
        'https://www.omgubuntu.co.uk',
        'Omg! Ubuntu!',
        'a.layout__title-link',
        7,
    )
    print_news(
        'https://news.ycombinator.com',
        'Hacker News',
        'a.storylink',
        7,
        30,
        True
    )
