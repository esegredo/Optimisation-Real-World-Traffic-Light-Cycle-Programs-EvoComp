set bmargin 4
#set xrange [0:362]
#set yrange [650:950]

set format y "%g"
set format x "%g"

set key top right
#set key spacing 1.5

set xlabel "Number of evaluations" font "Helvetica,22"
set ylabel "Mean objective function value" font "Helvetica,22"
set title  "City: Paris - 10000 evals. - 30 exec." font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
#set xtics 0, 6000, 41400
set ytics font "Helvetica,20"

set output "images/FirstExp/meanObjEvo_FirstExp_paris.eps"

plot "results/FirstExp/NSGA2_Multi_DCN/Centella_NSGA2_Multi_DCN_Sumo_paris_FirstExp_Mutate_Pol_Crossover_Uniform_100_0.00223214285714286_1_10000.avgHV.evolution" with linespoints lt -1 pt 7 pi -2 ps 1.5 lc rgb 'blue' title "NSGAII-DCN", "results/FirstExp/NSGA2_Multi_DBI/Centella_NSGA2_Multi_DBI_Sumo_paris_FirstExp_Mutate_Pol_Crossover_Uniform_100_0.00223214285714286_1_10000.avgHV.evolution" with linespoints lt -1 pt 7 pi -2 ps 1.5 lc rgb "red" title "NSGAII-DBI", "results/FirstExp/NSGA2_Multi_ADI/Centella_NSGA2_Multi_ADI_Sumo_paris_FirstExp_Mutate_Pol_Crossover_Uniform_100_0.00223214285714286_1_10000.avgHV.evolution" with linespoints lt -1 pt 7 pi -2 ps 1.5 lc rgb 'black' title "NSGAII-ADI"
