#!/bin/bash

v=0

notify-send "El PID de este demonio es: $$"

while [ "${v}" -eq 0 ]
do
	users=$(w | grep "," | awk '{print $4}')
	((users--))

	if [ "${users}" -ge 1 ];then
	elemento=0
	IP=($(w | grep "pts/" | awk '{print $3}'))
	user=($(w | grep "pts/" | awk '{print $1}'))
	for i in "${IP[@]}";do
		notify-send "NEUTRALIZADOR:" "Se ha detectado una conexión SSH de $i con el usuario ${user[${elemento}]}"
		id=($(w | grep "pts/" | awk '{print $2}'))
		if [ "$(pkill -9 -t "${id[${elemento}]}" 2>/dev/null)" ];then
			notify-send "No se ha podido expulsar al usuario ${user[${elemento}]} de ${IP[${elemento}]}"
			((elemento++))
		fi	
	done
	
	fi
		sleep 8s
done