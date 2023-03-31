#!/bin/bash
redshift -O 4500~
redshift -x

if [ -f "/tmp/redshift" ]; then
    redshift -x
    rm -f "/tmp/redshift"
else
    redshift -O 4500~ -m randr
    touch "/tmp/redshift"
fi