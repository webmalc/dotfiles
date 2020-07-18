#!/usr/bin/python
import re
from calendar import SUNDAY, TextCalendar, month
from datetime import date

today = date.today()
day = str(date.today().day)
result = month(today.year, today.month)
weekends = ['Sa', 'Su']
days = result.splitlines()
header = days[0]
content = '\n'.join(days[1:])

cal = TextCalendar(SUNDAY)
for i in cal.itermonthdays(today.year, today.month):
    if i != 0:
        if date(today.year, today.month, i).weekday() >= 5:
            weekends.append(str(i))

for weekend in weekends:
    content = re.sub(
        weekend + '(?![\d,\}])',
        '${color2}' + weekend + '${color}',
        content,
        count=1)
content = re.sub(
    day + '(?!\d)', '${color1}' + day + '${color}', content, count=1)
result = header + '\n' + content
print(result)
