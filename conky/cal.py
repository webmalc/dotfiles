#!/usr/bin/python
import re
from calendar import month
from datetime import date

today = date.today()
day = str(date.today().day)
result = month(today.year, today.month)
weekends = []
days = iter(result.splitlines())
days.next()
for line in days:
    elements = re.split('\s', line)
    if len(elements) >= 7:
        elements = filter(lambda x: x != '', elements)
        weekends.extend([e for e in elements[-2:] if e != day])

result = re.sub(
    day + '(?!\d)', '${color1}' + day + '${color}', result, count=1)
for weekend in weekends:
    result = re.sub(
        weekend + '(?!\d)',
        '${color2}' + weekend + '${color}',
        result,
        count=1)
print(result[:-1])
