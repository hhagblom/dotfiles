#|/bin/bash

#  xinput --set-prop 'bcm5974' 'libinput Accel Speed' 0.8

ENABLED=$(xinput --list-props 'bcm5974' | grep 'Device Enabled' | cut -f 3)

if [ $ENABLED -eq 1 ]; then
	xinput --set-prop 'bcm5974' 'Device Enabled' 0
else
	xinput --set-prop 'bcm5974' 'Device Enabled' 1
fi
