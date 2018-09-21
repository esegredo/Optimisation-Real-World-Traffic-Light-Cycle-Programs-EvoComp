#!/usr/bin/perl
use warnings;
use strict;

my @problems = qw {berlin malaga paris stockholm};
my %hash_numVar = (berlin => 611, paris => 448, stockholm => 445, malaga => 4761);

for my $problem (@problems) {

  my $pm = 1 / $hash_numVar{$problem};

  my $script = qq{postscript("images/FirstExp/boxplot_allHV_LongExec_${problem}.eps", horizontal=FALSE, height=8, width=16, pointsize=12)
data1<-scan("results/FirstExp/MonoGA_LongExec/Centella_MonoGA_Sumo_${problem}_LongExec_Mutate_Pol_Crossover_Uniform_100_${pm}_1_864000_864000.allHV")
data2<-scan("results/FirstExp/NSGA2_Multi_DCN_LongExec/Centella_NSGA2_Multi_DCN_Sumo_${problem}_LongExec_Mutate_Pol_Crossover_Uniform_100_${pm}_1_864000_864000.allHV")
dataM<-matrix(c(data1,data2), 2)
library("Rlab")
bplot(dataM, space = 0.6, labels = c("MonoGA", "NSGA2_DCN"), ylab = "Objective value", main = "${problem} - 10 days")
dev.off()};

  open FILE, "> boxplot_allHV_LongExec_${problem}.R";
  print FILE $script;
  close FILE;
}
