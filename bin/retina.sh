set -x

external_display=$(xrandr | grep \ connected | cut -d' ' -f 1 | grep -e '^DP[0-9]')

echo "External display was connected on $external_display"

if [ -n $external_display ]; then
	xrandr --output $external_display --off
fi


xrandr --output eDP1 --mode "2880x1800_60.00"
xrandr --dpi 144 

