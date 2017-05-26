#!/bin/bash

set -x

echo "Trying to enable external display"
external_display=$(xrandr | grep \ connected | cut -d' ' -f 1 | grep -e '^DP[0-9]')
DP_Found=$?


if [ -z $external_display ]; then
	external_display=$(xrandr | grep \ connected | cut -d' ' -f 1 | grep -e '^HDMI[0-9]')
	HDMI=1
fi

if [ -z $external_display ]; then
	i3-nagbar -m 'External display does not seem to be connected' -t warning&
	exit 1
fi

echo "External Display was connected at port $external_display"

if [ $HDMI -eq 1 ]; then
	xrandr --output $external_display --preferred --primary 
	xrandr --dpi 72 # This is good for the dell screen at jayway
else
	xrandr --output $external_display --mode "2560x1440" --primary
	xrandr --dpi 96
fi

xrandr --output eDP1 --off 
