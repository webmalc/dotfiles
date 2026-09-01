#!/bin/bash
if [ -f "/tmp/redshift" ]; then
  redshift -x
  rm -f "/tmp/redshift"
else
  redshift -O 5000~ -m randr
  redshift -O 5000~ -m randr
  touch "/tmp/redshift"
fi

