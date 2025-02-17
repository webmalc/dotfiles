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
    url = 'https://www.merriam-webster.com/dictionary/' + random_word
    async with aiohttp.ClientSession() as session:
        async with session.get(url, headers={
                'User-Agent': 'curl/7.54.1',
        }) as response:
            html = await response.text()
    soup = BeautifulSoup(html, 'html.parser')
    word = soup.select_one('h1.hword').text
    word = '${font Ubuntu Mono:size=16}' + word.capitalize()

    element = soup.select_one('div.sense-content')
    if element:
        text = element.text
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


async def main():
    values = await asyncio.gather(run(), run('_toefl'))
    print('\n\n'.join(values))


if __name__ == '__main__':
    asyncio.run(main())
