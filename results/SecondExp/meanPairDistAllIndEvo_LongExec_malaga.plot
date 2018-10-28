set bmargin 4
#set xrange [0:362]
set yrange [-100:2600]

set format y "%g"
set format x "%g"

set key outside center right
#set key spacing 1.5

set xlabel "Time (days)" font "Helvetica,22"
set ylabel "Mean pairwise distance to all individuals" font "Helvetica,22"
set title  "City: Malaga - 4 days - 15 runs" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
#set xtics 0, 86400, 604800
set xtics ("1 day" 86400, "2 days" 172800, "3 days" 259200, "4 days" 345600)
set xtics rotate
set ytics font "Helvetica,20"

set output "images/Teide/meanPairDistAllIndEvo_LongExec_malaga.eps"

plot "results/Teide/NSGA2_Multi_DCN_diversity/Teide_NSGA2_Multi_DCN_Sumo_malaga_diversity_LongExec_Mutate_Pol_Crossover_Uniform_100_0.000210039907582441_1_345600.avgMeanPairDistAllInd" with linespoints lt -1 pi -1 pt 7 ps 1.5 lc rgb "blue" title "NSGAII-DCN", "results/Teide/MonoGA_diversity/Teide_MonoGA_Sumo_malaga_diversity_LongExec_Mutate_Pol_Crossover_Uniform_100_0.000210039907582441_1_345600.avgMeanPairDistAllInd" with linespoints lt -1 pi -1 pt 7 ps 1.5 lc rgb "red" title "MonoGA", "results/Teide/PSO_diversity/Teide_PSO_Sumo_malaga_diversity_LongExec_345600.avgMeanPairDistAllInd" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "black" title "PSO", "results/Teide/DE_diversity/Teide_DE_Sumo_malaga_diversity_LongExec_345600.avgMeanPairDistAllInd" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "green" title "DE"



#plot "results/Teide/NSGA2_Multi_DCN/Teide_NSGA2_Multi_DCN_Sumo_malaga_LongExec_Mutate_Pol_Crossover_Uniform_100_0.000210039907582441_1_604800.avgHV.evolution" with linespoints lt -1 pi -3 pt 6 ps 1.5 lc rgb "black" title "NSGA2-DCN", "results/Teide/MonoGA/Teide_MonoGA_Sumo_malaga_LongExec_Mutate_Pol_Crossover_Uniform_100_0.000210039907582441_1_604800.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "black" title "MonoGA", "results/Teide/PSO/Teide_PSO_sumo_malaga.avgHV.evolution" with linespoints lt -1 pi -3 pt 4 ps 1.5 lc rgb "black" title "PSO", "results/Teide/DE/Teide_DE_sumo_malaga.avgHV.evolution" with linespoints lt -1 pi -3 pt 5 ps 1.5 lc rgb "black" title "DE", "results/Teide/VNS/Teide_VNS_sumo_malaga.avgHV.evolution" with linespoints lt -1 pi -3 pt 5 ps 1.5 lc rgb '#696969' title "VNS"
