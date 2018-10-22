#!/usr/bin/perl
use warnings;
use strict;

my @problems = qw {malaga};
my @upperProblems = qw {Malaga};
my %hash_numVar = (berlin => 611, paris => 448, stockholm => 445, malaga => 4761);

for my $i (0..0) {
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

set xlabel "Time (days)" font "Helvetica,22"
set ylabel "Mean objective function value" font "Helvetica,22"
set title  "City: ${upperProblem} - 20 days - 30 runs" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
#set xtics 0, 172800, 1728000
set xtics ("2 days" 172800, "4 days" 345600, "6 days" 518400, "8 days" 691200, "10 days" 864000, "12 days" 1036800, "14 days" 1209600, "16 days" 1382400, "18 days" 1555200, "20 days" 1728000)
set xtics rotate
set ytics font "Helvetica,20"

set output "images/Teide-HPC/meanObjEvo_LongExec_${problem}_20days.eps"

plot "results/Teide-HPC/NSGA2_Multi_DCN/Teide_NSGA2_Multi_DCN_Sumo_${problem}_LongExec_Mutate_Pol_Crossover_Uniform_100_${pm}_1_1728000.avgHV.evolution" with linespoints lt -1 pi -4 pt 7 ps 1.5 lc rgb "blue" title "NSGAII-DCN", "results/Teide-HPC/MonoGA/Teide_MonoGA_Sumo_${problem}_LongExec_Mutate_Pol_Crossover_Uniform_100_${pm}_1_1728000.avgHV.evolution" with linespoints lt -1 pi -4 pt 7 ps 1.5 lc rgb "red" title "MonoGA"};

  open FILE, "> meanObjEvo_LongExec_${problem}_20days.plot";
  print FILE $script;
  close FILE;
}
