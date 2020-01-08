#!/usr/bin/python
import os
import random
import textwrap
import urllib2

from bs4 import BeautifulSoup


def random_line(afile):
    line = next(afile)
    for num, aline in enumerate(afile, 2):
        if random.randrange(num):
            continue
        line = aline
    return line


def get_word(random_word):
    html_page = urllib2.urlopen('https://www.vocabulary.com/dictionary/' +
                                random_word)
    soup = BeautifulSoup(html_page, 'html.parser')
    word = soup.select_one('h1.dynamictext').text
    word = '${font Ubuntu Mono:size=16}' + word.capitalize()

    element = soup.select_one('p.short')
    if element:
        text = element.text
    else:
        text = soup.select_one('h3.definition').text[10:].strip()
    text = '${font Ubuntu Mono:size=12}' + textwrap.fill(text, 35)
    result = u'{}\n\n{}'.format(word, text)
    return result


def get_random_word(d=''):
    base_dir = os.path.dirname(os.path.abspath(__file__))
    filename = os.path.join(base_dir, 'words{}.txt'.format(d))
    with open(filename, 'r') as words_file:
        random_word = random_line(words_file).strip()
    return random_word


def run(d=''):
    try:
        CONTENT = get_word(get_random_word(d))
    except:
        CONTENT = get_word('randomword')

    return CONTENT.encode('utf-8')


print(run())
print('\n')
print(run('_toelf'))
