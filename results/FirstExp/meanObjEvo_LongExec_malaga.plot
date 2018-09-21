set bmargin 4
#set xrange [0:362]
#set yrange [650:950]

set format y "%g"
set format x "%g"

set key top right
#set key spacing 1.5

set xlabel "Time (seconds)" font "Helvetica,22"
set ylabel "Mean objective function value" font "Helvetica,22"
set title  "City: malaga - 10 days" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
set xtics 0, 86400, 864000
set xtics rotate
set ytics font "Helvetica,20"

set output "images/FirstExp/meanObjEvo_LongExec_malaga.eps"

plot "results/FirstExp/MonoGA_LongExec/Centella_MonoGA_Sumo_malaga_LongExec_Mutate_Pol_Crossover_Uniform_100_0.000210039907582441_1_864000.avgHV.evolution" with linespoints title "MonoGA", "results/FirstExp/NSGA2_Multi_DCN_LongExec/Centella_NSGA2_Multi_DCN_Sumo_malaga_LongExec_Mutate_Pol_Crossover_Uniform_100_0.000210039907582441_1_864000.avgHV.evolution" with linespoints title "NSGA2-Multi-DCN"