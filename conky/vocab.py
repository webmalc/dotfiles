#!/usr/bin/python3
import asyncio
import os
import random
import textwrap

import aiohttp
from bs4 import BeautifulSoup


def random_line(afile):
    line = next(afile)
    for num, aline in enumerate(afile, 2):
        if random.randrange(num):
            continue
        line = aline
    return line


async def get_word(random_word):
    url = 'https://www.vocabulary.com/dictionary/' + random_word
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            html = await response.text()
    soup = BeautifulSoup(html, 'html.parser')
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
        content = get_word(get_random_word(d))
    except:
        content = get_word('randomword')

    return content


loop = asyncio.get_event_loop()
values, _ = loop.run_until_complete(asyncio.wait([run(), run('_toelf')]))
print('\n\n'.join([v.result() for v in values]))
