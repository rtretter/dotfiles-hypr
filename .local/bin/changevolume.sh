#!/bin/bash

function send_notification() {
	volume=$(pamixer --get-volume)
	dunstify -i ~/.local/share/dunst/icons/player-volume.svg -a "changevolume" -u normal -r 9993 -h int:value:"$volume" "Volume: ${volume}%" -t 2000
}

case $1 in
up)
	# Set the volume on (if it was muted)
	pamixer -u
	volume=$(pamixer --get-volume)
	if (($volume >= 145)); then
		pamixer --set-volume 150 --allow-boost
	else
		pamixer -i 5 --allow-boost
	fi
	send_notification $1
	;;
down)
	volume=$(pamixer --get-volume)
	if (($volume <= 5)); then
		pamixer --set-volume 0
		pamixer -m
		dunstify -i ~/.local/share/dunst/icons/player-volume-muted.svg -a "changevolume" -t 2000 -r 9993 -u low "Sound muted!"
	else
        pamixer -u
        pamixer -d 5 --allow-boost
        send_notification $1
	fi
	;;
mute)
	pamixer -t
	if $(pamixer --get-mute); then
		dunstify -i ~/.local/share/dunst/icons/player-volume-muted.svg -a "changevolume" -t 2000 -r 9993 -u low "Sound muted!"
	else
		send_notification up
	fi
	;;
esac
