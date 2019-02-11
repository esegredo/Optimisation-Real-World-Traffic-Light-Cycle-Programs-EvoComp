set bmargin 4
#set xrange [0:362]
set yrange [-50:950]

set format y "%g"
set format x "%g"

set key outside center right
#set key spacing 1.5

set xlabel "Time (days)" font "Helvetica,22"
set ylabel "Mean pairwise distance to all individuals" font "Helvetica,22"
set title  "City: Berlin - 4 days - 15 runs" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
#set xtics 0, 86400, 604800
set xtics ("1 day" 86400, "2 days" 172800, "3 days" 259200, "4 days" 345600)
set xtics rotate
set ytics font "Helvetica,20"

set output "images/ThirdExp/meanPairDistAllIndEvo_LongExec_berlin.eps"

plot "results/ThirdExp/NSGA2_Multi_DCN_diversity/Teide_NSGA2_Multi_DCN_Sumo_berlin_diversity_LongExec_Mutate_Pol_Crossover_Uniform_100_0.0016366612111293_1_345600.avgMeanPairDistAllInd" with linespoints lt -1 pi -1 pt 7 ps 1.5 lc rgb "blue" title "NSGAII-DCN", "results/ThirdExp/MonoGA_diversity/Teide_MonoGA_Sumo_berlin_diversity_LongExec_Mutate_Pol_Crossover_Uniform_100_0.0016366612111293_1_345600.avgMeanPairDistAllInd" with linespoints lt -1 pi -1 pt 7 ps 1.5 lc rgb "red" title "MonoGA", "results/ThirdExp/PSO_diversity/Teide_PSO_Sumo_berlin_diversity_LongExec_345600.avgMeanPairDistAllInd" with linespoints lt -1 pi -1 pt 7 ps 1.5 lc rgb "black" title "PSO"
