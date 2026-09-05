#!/bin/bash

echo " que van a jugar: "
read -p "karioca o mil: " juego
if [ $juego = "karioca" -o $juego = "mil" ]; then
read -p "cuantos jugadores son? " cantidad
for ((i=0;i<cantidad;i++)); do
 read -p " el nombre del jugador numero $((i+1)) es : " nombre
 jugadores[i]=$nombre
done
for ((i=0;i<cantidad;i++)); do
 sum[i]=0;
done
echo "------------------------"
echo " los jugadores y sus puntajes : "
for((i=0;i<cantidad;i++)); do
 echo "${jugadores[i]} : ${sum[i]} "
done
case $juego in
mil)
while true; do
 for ((i=0;i<50;i++)); do
  echo " anota los puntajes de los jugadores de la ronda $((i+1)) " 
  for((j=0;j<cantidad;j++)); do
   read -p " el jugador ${jugadores[j]} obtuvo: " puntaje
   sum[j]=$((sum[j]+puntaje))
  done
  echo " el recuento de puntos de esta ronda fue: "
  for((j=0;j<cantidad;j++)); do
   echo "${jugadores[j]} : ${sum[j]}"
  done  
  for ((j=0;j<cantidad;j++)); do
   if [ ${sum[j]} -ge 1000 ]; then
    echo " el ganandor es ${jugadores[j]} con ${sum[j]} puntos!!!! "
    echo " juego terminado... "
    break 3
   fi
  done 
 done
done
;;
karioca)
while true; do
 for ((i=0;i<9;i++)); do
  echo "anota los puntajes de los jugadores de la ronda $((i+1)) "
  for((j=0;j<cantidad;j++)); do
   read -p " el jugador ${jugadores[j]} obtuvo: " puntaje
   ((sum[j] += puntaje))
  done  
  echo " el recuento de puntos de esta ronda fue: "
  for((j=0;j<cantidad;j++)); do
   echo "${jugadores[j]} : ${sum[j]}"
  done
  indice_menor=0
  for ((j=1;j<cantidad;j++)); do
   if [ ${sum[j]} -lt ${sum[indice_menor]} ]; then
    indice_menor=$j
   fi
  done 
 done
 echo " el ganador es ${jugadores[indice_menor]} con ${sum[indice_menor]} "
 echo "juego terminado..."
 break  
done
;;
*)
echo " no existe esa respuesta, coloque una opcion correcta "
;;
esac
else
 echo "no existe esa opcion, elige algunas de las opciones que existen"
fi
