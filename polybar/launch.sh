#!/bin/bash

killall -q polybar
echo "---" | tee -a /tmp/polybar_example.log
polybar example >>/tmp/polybar_example.logh
