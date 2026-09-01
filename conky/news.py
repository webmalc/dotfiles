#!/usr/bin/python3
import asyncio
import sys
import textwrap

import aiohttp
from bs4 import BeautifulSoup

mode = "right"
if len(sys.argv) > 1 and sys.argv[1] in (
    "left",
    "right",
    "second",
    "third",
    "fourth",
):
    mode = sys.argv[1]

STATUS_CODES = (200, 429)
MAX_ATTEMPTS = 10


async def get_http(url, is_json=False):
    """Get the content"""
    get_http.counter += 1
    headers = {
        # 'User-Agent':
        # 'Mozilla/5.0 (X11; Linux x86_64; rv:135.0) Gecko/20100101 Firefox/135.0'
    }
    async with aiohttp.ClientSession() as session:
        async with session.get(url, raise_for_status=True, headers=headers) as response:
            if response.status not in STATUS_CODES:
                if get_http.counter > MAX_ATTEMPTS:
                    return ""
                await asyncio.sleep(1)
                return await get_http(url, is_json)
            return await response.json() if is_json else await response.text()


get_http.counter = 0


def get_header(title) -> str:
    """
    Generate the header
    """
    title_str = "${font Ubuntu Mono:size=16:weight=bold}${color2}"
    title_str += title + "${color}${font Ubuntu Mono:size=11}"
    return f"{title_str}\n\n"


def get_items(items, wrap) -> str:
    """
    Format the items with word wrapping
    """
    result = ""
    for item in items:
        content = textwrap.fill(item.replace("$", "$$").strip(), wrap)
        result += f"{content}\n\n"
    return result


async def print_habr():
    """
    Fetch and print Habr news
    """
    json = await get_http(
        "https://habr.com/kek/v2/articles/most-reading?fl=ru",
        is_json=True,
    )
    result = get_header("Habr")
    items = [x["titleHtml"] for x in json["articleRefs"].values()]
    result += get_items(items[:8], 30)
    return result


async def print_news(url, title, selector, num, wrap=38):
    """
    Fetch and print generic news
    """
    html = await get_http(url)
    soup = BeautifulSoup(html, "html.parser")
    items = soup.select(selector)[:num]
    result = get_header(title)
    result += get_items([x.text for x in items], wrap)
    return result


async def main():
    """
    Main asynchronous function
    """
    if mode == "right":
        commands = [
            print_news(
                "https://slashdot.org/popular",
                "Slashdot",
                ".story-title",
                5,
            ),
            print_habr(),
        ]
    elif mode == "left":
        commands = [
            print_news(
                "https://www.omgubuntu.co.uk",
                "Omg! Ubuntu!",
                "a.layout__title-link",
                7,
            ),
            print_news(
                "https://news.ycombinator.com/best",
                "Hacker News",
                "span.titleline",
                7,
            ),
        ]
    elif mode == "second":
        commands = [
            print_news(
                "https://dev.to/top/week",
                "Dev.to",
                "h2.crayons-story__title",
                7,
            ),
            # print_news(
            #     'https://www.reddit.com/r/programming/top/?t=week',
            #     'Reddit Programming',
            #     'article faceplate-screen-reader-content',
            #     3,
            # ),
            print_news(
                "https://habr.com/ru/hubs/artificial_intelligence/articles/top/daily/",
                "Habr AI",
                "h2.tm-title_h2",
                7,
            ),
        ]

    elif mode == "third":
        commands = [
            print_news(
                "https://www.rbc.ru/",
                "RBC",
                ".news-line-title",
                10,
            ),
            print_news(
                "https://www.rbc.ru/politics",
                "RBC politics",
                "span.item__title",
                10,
            ),
        ]

    elif mode == "fourth":
        commands = [
            print_news(
                "https://www.rbc.ru/politics",
                "RBC politics",
                "span.item__title",
                20,
            ),
        ]
    results = await asyncio.gather(*commands)
    print("$hr\n\n".join(results))


if __name__ == "__main__":
    asyncio.run(main())
