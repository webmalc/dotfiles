#!/usr/bin/python
import re
from calendar import month
from datetime import date

today = date.today()
day = str(date.today().day)
result = month(today.year, today.month)
weekends = []
days = result.splitlines()
header = days[0]
content = '\n'.join(days[1:])

for line in days[1:]:
    elements = re.split('\s', line)
    if len(elements) >= 7:
        elements = filter(lambda x: x != '', elements)
        weekends.extend([e for e in elements[-2:] if e != day])

content = re.sub(day + '(?!\d)',
                 '${color1}' + day + '${color}',
                 content,
                 count=1)
for weekend in weekends:
    content = re.sub(weekend + '(?!\d)',
                     '${color2}' + weekend + '${color}',
                     content,
                     count=1)
result = header + '\n' + content
print(result)
