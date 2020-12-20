#!/bin/bash

v=0

notify-send "El PID de este demonio es: $$"

while [ "${v}" -eq 0 ]
do
	users=$(w | grep "user" | awk '{print $5}')
	((users--))

	if [ "${users}" -ge 1 ];then
	elemento=0
	IP=($(w | grep "pts/" | awk '{print $3}'))
	user=($(w | grep "pts/" | awk '{print $1}'))
	for i in "${IP[@]}";do
	notify-send "DETECTOR:" "Se ha detectado una conexión SSH de $i con el usuario ${user[${elemento}]}"
	((elemento++))
	done
	
	fi
		sleep 8s
done