#!/usr/bin/python
import re
from calendar import month
from datetime import date

today = date.today()
day = str(date.today().day)
result = month(today.year, today.month)
result = re.sub(day + '(?!\d)',
                '${color1}' + day + '${color}',
                result,
                count=1)
print(result[:-1])
