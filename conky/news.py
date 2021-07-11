#!/usr/bin/python3
import asyncio
import sys
import textwrap

import aiohttp
from bs4 import BeautifulSoup

LEFT = len(sys.argv) > 1

STATUS_CODES = (200, 429)
MAX_ATTEMPTS = 10


async def get_http(url, is_json=False):
    """Get the content"""
    get_http.counter += 1
    async with aiohttp.ClientSession() as session:
        async with session.get(url, raise_for_status=True) as response:
            if response.status not in STATUS_CODES:
                if get_http.counter > MAX_ATTEMPTS:
                    return ''
                await asyncio.sleep(1)
                return await get_http(url)
            if not is_json:
                return await response.text()
            else:
                return await response.json()


get_http.counter = 0


def get_header(title) -> str:
    """
    Print the header
    """
    title_str = '${font Ubuntu Mono:size=16}'
    title_str += title + '${font Ubuntu Mono:size=12}'
    return f'{title_str}\n\n'


def get_items(items, wrap) -> str:
    """
    Print the header
    """
    result = ''
    for item in items:
        content = textwrap.fill(item.replace('$', '$$').strip(), wrap)
        result += f'{content}\n\n'
    return result


async def print_habr():
    """
    Print habr news
    """
    json = await get_http(
        "https://habr.com/kek/v2/articles/most-reading?fl=ru",
        is_json=True,
    )
    result = get_header("Habr")
    items = [x["titleHtml"] for x in json['articles']['articleRefs'].values()]
    result += get_items(items[:8], 30)
    return result


async def print_news(url, title, selector, num, wrap=30):
    """
    Print news
    """
    html = await get_http(url)
    soup = BeautifulSoup(html, 'html.parser')
    items = soup.select(selector)[:num]
    result = get_header(title)
    result += get_items([x.text for x in items], wrap)
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
            print_habr()
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
            )
        ]
    loop = asyncio.get_event_loop()
    values, _ = loop.run_until_complete(asyncio.wait(commands))
    print('$hr\n\n'.join([v.result() for v in values]))


if __name__ == '__main__':
    run()
