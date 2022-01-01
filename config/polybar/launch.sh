killall -q polybar

if type "xrandr"; then
	for display in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$display polybar -c $HOME/.config/polybar/dots-spacegray-config main
	done
else
	polybar -c $HOME/.config/polybar/dots-spacegray-config main
fi
