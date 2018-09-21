#!/usr/bin/perl
use warnings;
use strict;

my @problems = qw {berlin malaga paris stockholm};
my %hash_numVar = (berlin => 611, paris => 448, stockholm => 445, malaga => 4761);

for my $problem (@problems) {
  
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
set title  "City: ${problem} - 10 days" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
set xtics 0, 86400, 864000
set xtics rotate
set ytics font "Helvetica,20"

set output "images/FirstExp/meanObjEvo_LongExec_${problem}.eps"

plot "results/FirstExp/MonoGA_LongExec/Centella_MonoGA_Sumo_${problem}_LongExec_Mutate_Pol_Crossover_Uniform_100_${pm}_1_864000.avgHV.evolution" with linespoints title "MonoGA", "results/FirstExp/NSGA2_Multi_DCN_LongExec/Centella_NSGA2_Multi_DCN_Sumo_${problem}_LongExec_Mutate_Pol_Crossover_Uniform_100_${pm}_1_864000.avgHV.evolution" with linespoints title "NSGA2-Multi-DCN"};

  open FILE, "> meanObjEvo_LongExec_${problem}.plot";
  print FILE $script;
  close FILE;
}
