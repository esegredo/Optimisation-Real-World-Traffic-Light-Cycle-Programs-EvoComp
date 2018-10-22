#!/usr/bin/perl
use warnings;
use strict;

my @problems = qw {berlin malaga paris stockholm};
my @upperProblems = qw {Berlin Malaga Paris Stockholm};
my %hash_numVar = (berlin => 611, paris => 448, stockholm => 445, malaga => 4761);

for my $i (0..3) {
  my $problem = $problems[$i];
	my $upperProblem = $upperProblems[$i];
  
  my $pm = 1 / $hash_numVar{$problem};

  my $script = qq{set bmargin 4
#set xrange [0:362]
#set yrange [650:950]

set format y "%g"
set format x "%g"

set key top right
#set key spacing 1.5

set xlabel "Time (seconds)" font "Helvetica,22"
set ylabel "Mean objective function value" font "Helvetica,22"
set title  "City: ${upperProblem} - 7 days - 30 runs" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
#set xtics 0, 86400, 604800
set xtics ("1 day" 86400, "2 days" 172800, "3 days" 259200, "4 days" 345600, "5 days" 432000, "6 days" 518400, "7 days" 604800)
set xtics rotate
set ytics font "Helvetica,20"

set output "images/Teide-HPC/meanObjEvo_LongExec_${problem}.eps"

plot "results/Teide-HPC/NSGA2_Multi_DCN/Teide_NSGA2_Multi_DCN_Sumo_${problem}_LongExec_Mutate_Pol_Crossover_Uniform_100_${pm}_1_604800.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "blue" title "NSGAII-DCN", "results/Teide-HPC/MonoGA/Teide_MonoGA_Sumo_${problem}_LongExec_Mutate_Pol_Crossover_Uniform_100_${pm}_1_604800.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "red" title "MonoGA", "results/Teide-HPC/PSO/Teide_PSO_sumo_${problem}.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "black" title "PSO", "results/Teide-HPC/DE/Teide_DE_sumo_${problem}.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "green" title "DE", "results/Teide-HPC/VNS/Teide_VNS_sumo_${problem}.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb 'yellow' title "VNS"};

  open FILE, "> meanObjEvo_LongExec_${problem}.plot";
  print FILE $script;
  close FILE;
}
