set bmargin 4
#set xrange [0:362]
#set yrange [650:950]

set format y "%g"
set format x "%g"

set key top right
#set key spacing 1.5

set xlabel "Time (s)" font "Helvetica,22"
set ylabel "Mean objective function value" font "Helvetica,22"
set title  "City: Berlin - 24 hours - 30 exec." font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
#set xtics 0, 6000, 41400
set ytics font "Helvetica,20"

set output "images/mean_obj_evolution_MonoGA_Berlin.eps"

plot "results/Centella_MonoGA_Sumo_Preliminary_Berlin_Mutate_Pol_Crossover_SBX_10_86400.avgHV.evolution" with linespoints title "PolSBX10", "results/Centella_MonoGA_Sumo_Preliminary_Berlin_Mutate_Pol_Crossover_SBX_100_86400.avgHV.evolution" with linespoints title "PolSBX100","results/Centella_MonoGA_Sumo_Preliminary_Berlin_Mutate_Pol_Crossover_Uniform_10_86400.avgHV.evolution" with linespoints title "PolUni10", "results/Centella_MonoGA_Sumo_Preliminary_Berlin_Mutate_Pol_Crossover_Uniform_100_86400.avgHV.evolution" with linespoints title "PolUni100", "results/Centella_MonoGA_Sumo_Preliminary_Berlin_Mutate_Uniform_Crossover_SBX_10_86400.avgHV.evolution" with linespoints title "UniSBX10", "results/Centella_MonoGA_Sumo_Preliminary_Berlin_Mutate_Uniform_Crossover_SBX_100_86400.avgHV.evolution" with linespoints title "UniSBX100", "results/Centella_MonoGA_Sumo_Preliminary_Berlin_Mutate_Uniform_Crossover_Uniform_10_86400.avgHV.evolution" with linespoints title "UniUni10", "results/Centella_MonoGA_Sumo_Preliminary_Berlin_Mutate_Uniform_Crossover_Uniform_100_86400.avgHV.evolution" with linespoints title "UniUni100"