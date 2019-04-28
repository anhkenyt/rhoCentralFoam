#!/bin/bash

#gnuplot -persist > /dev/null 2>&1 << EOF
set terminal wxt size 900,600 enhanced dashed #dashlength 2
#set style function linespoints

#set output 'migration.png'
#set xlabel "x/L" font "Arial, 20" #offset 0,-1,0
#set ylabel "Migration flux (x10^8)" font "Arial, 20" offset -2,0,0
#set xtics font "Ubuntu, 16"
#set ytics font "Ubuntu, 16"
#set xr [1:100]
#set yr [0:60]

#set lmargin 15
#set bmargin 5
#set key box vertical width 3 height 1 maxcols 5 spacing 3 font 'Arial, 16'
#set datafile separator ","
#set title "Temperature values after Shock and Expansion Waves"
  #    set xlabel "X (meters)"
  #    set ylabel "Temperature (K)"

set datafile separator ","
set title "Density values after Shock and Expansion Waves"
      set xlabel "X (meters)"
      set ylabel "Density (kg/m^3)"

#plot "centerLine0.csv" using 6:3 w l lt 1 lc rgb 'red' lw 1.5 title 'Temperature' 
plot "centerLine1.csv" using 8:6 w l lt 1 lc rgb 'red' lw 1.5 title 'rho',\
#"centerLine1.csv" using 8:5 w l lt 1 lc rgb 'blue' lw 1.5 title 'Pressure',\
#plot "centerLine1.csv" using 8:2 w l lt 1 lc rgb 'red' lw 1.5 title 'rho'
#"centerLine0.csv" using 8:2 w l lt 1 lc rgb 'grey' lw 1.5 title 'U' 
#"electromigrationFlux_U200_10V.csv" using 1:($4*10e8) w l lt 1 lc rgb 'black' lw 1.5 title 'cH3' ,\


pause -1 #khong tat dont move
