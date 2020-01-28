#!/usr/bin/python3
import asyncio
import sys
import textwrap

import aiohttp
from bs4 import BeautifulSoup

LEFT = len(sys.argv) > 1


async def print_news(url, title, selector, num, wrap=30, hr=False):
    """
    Print news
    """
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            html = await response.text()
    soup = BeautifulSoup(html, 'html.parser')
    items = soup.select(selector)[:num]
    title_str = '${font Ubuntu Mono:size=16}'
    title_str += title + '${font Ubuntu Mono:size=12}'
    result = f'{title_str}\n\n'
    for item in items:
        content = textwrap.fill(item.text.replace('$', '$$').strip(), wrap)
        result += f'{content}\n\n'
    return result


def run():
    """
    Run the main loop
    """

    if not LEFT:
        commands = [
            print_news(
                'https://slashdot.org/popular',
                'Slashdot',
                '.story-title',
                5,
            ),
            print_news(
                'https://habr.com/ru/top/',
                'Habr',
                '.content-list_most-read a.post-info__title',
                7,
                30,
                True,
            )
        ]
    else:
        commands = [
            print_news(
                'https://www.omgubuntu.co.uk',
                'Omg! Ubuntu!',
                'a.layout__title-link',
                7,
            ),
            print_news(
                'https://news.ycombinator.com',
                'Hacker News',
                'a.storylink',
                7,
                30,
                True,
            )
        ]
    loop = asyncio.get_event_loop()
    values, _ = loop.run_until_complete(asyncio.wait(commands))
    print('$hr\n\n'.join([v.result() for v in values]))


if __name__ == '__main__':
    run()
