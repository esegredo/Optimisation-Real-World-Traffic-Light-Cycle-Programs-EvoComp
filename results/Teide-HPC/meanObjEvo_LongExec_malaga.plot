set bmargin 4
#set xrange [0:362]
#set yrange [650:950]

set format y "%g"
set format x "%g"

set key top right
#set key spacing 1.5

set xlabel "Time (seconds)" font "Helvetica,22"
set ylabel "Mean objective function value" font "Helvetica,22"
set title  "City: Malaga - 7 days - 30 runs" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
#set xtics 0, 86400, 604800
set xtics ("1 day" 86400, "2 days" 172800, "3 days" 259200, "4 days" 345600, "5 days" 432000, "6 days" 518400, "7 days" 604800)
set xtics rotate
set ytics font "Helvetica,20"

set output "images/Teide/meanObjEvo_LongExec_malaga.eps"

plot "results/Teide/NSGA2_Multi_DCN/Teide_NSGA2_Multi_DCN_Sumo_malaga_LongExec_Mutate_Pol_Crossover_Uniform_100_0.000210039907582441_1_604800.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "blue" title "NSGAII-DCN", "results/Teide/MonoGA/Teide_MonoGA_Sumo_malaga_LongExec_Mutate_Pol_Crossover_Uniform_100_0.000210039907582441_1_604800.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "red" title "MonoGA", "results/Teide/PSO/Teide_PSO_sumo_malaga.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "black" title "PSO", "results/Teide/DE/Teide_DE_sumo_malaga.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "green" title "DE", "results/Teide/VNS/Teide_VNS_sumo_malaga.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb 'yellow' title "VNS"