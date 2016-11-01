set -x

echo "Trying to enable external display"
external_display=$(xrandr | grep \ connected | cut -d' ' -f 1 | grep -e '^DP[0-9]')
echo "Last execution status $?"

if [ -z $external_display ]; then
	i3-nagbar -m 'External display does not seem to be connected' -t warning&
	exit 1
fi

echo "External Display was connected at port $external_display"

xrandr --output $external_display --mode "2560x1440"
xrandr --dpi 96

xrandr --output eDP1 --off 
