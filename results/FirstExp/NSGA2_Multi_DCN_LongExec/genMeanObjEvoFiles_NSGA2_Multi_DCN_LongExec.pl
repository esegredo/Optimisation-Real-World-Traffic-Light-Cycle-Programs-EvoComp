#!/usr/bin/perl
use warnings;
use strict;

my $script = qq{set bmargin 4
#set xrange [0:362]
#set yrange [650:950]

set format y "%g"
set format x "%g"

set key top right
#set key spacing 1.5

set xlabel "Time (s)" font "Helvetica,22"
set ylabel "Mean objective function value" font "Helvetica,22"
set title  "All instances - 10 days - 2 exec." font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
set xtics 0, 86400, 864000
set xtics rotate
set ytics font "Helvetica,20"

set output "images/FirstExp/meanObjEvo_NSGA2_Multi_DCN_LongExec.eps"

plot "results/FirstExp/NSGA2_Multi_DCN_LongExec/Centella_NSGA2_Multi_DCN_Sumo_berlin_LongExec_Mutate_Pol_Crossover_Uniform_100_0.0016366612111293_1_864000.avgHV.evolution" with linespoints title "Berlin", "results/FirstExp/NSGA2_Multi_DCN_LongExec/Centella_NSGA2_Multi_DCN_Sumo_paris_LongExec_Mutate_Pol_Crossover_Uniform_100_0.00223214285714286_1_864000.avgHV.evolution" with linespoints title "Paris", "results/FirstExp/NSGA2_Multi_DCN_LongExec/Centella_NSGA2_Multi_DCN_Sumo_stockholm_LongExec_Mutate_Pol_Crossover_Uniform_100_0.00224719101123596_1_864000.avgHV.evolution" with linespoints title "Stockholm", "results/FirstExp/NSGA2_Multi_DCN_LongExec/Centella_NSGA2_Multi_DCN_Sumo_malaga_LongExec_Mutate_Pol_Crossover_Uniform_100_0.000210039907582441_1_864000.avgHV.evolution" with linespoints title "Malaga"};

open FILE, "> meanObjEvo_NSGA2_Multi_DCN_LongExec.plot";
print FILE $script;
close FILE;

