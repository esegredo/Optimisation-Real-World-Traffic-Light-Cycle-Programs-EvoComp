#!/usr/bin/perl
use warnings;
use strict;

my @problems = qw {Berlin};

for my $problem (@problems) {

  my $script = qq{postscript("images/boxplot_allHV_MonoGA_${problem}.eps", horizontal=FALSE, height=8, width=16, pointsize=12)
data1<-scan("results/Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_SBX_10_86400_86400.allHV")
data2<-scan("results/Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_SBX_100_86400_86400.allHV")
data3<-scan("results/Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_Uniform_10_86400_86400.allHV")
data4<-scan("results/Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_Uniform_100_86400_86400.allHV")
data5<-scan("results/Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_SBX_10_86400_86400.allHV")
data6<-scan("results/Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_SBX_100_86400_86400.allHV")
data7<-scan("results/Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_Uniform_10_86400_86400.allHV")
data8<-scan("results/Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_Uniform_100_86400_86400.allHV")
dataM<-matrix(c(data1,data2,data3,data4,data5,data6,data7,data8), 30)
library("Rlab")
bplot(dataM, space = 0.6, labels = c("PolSBX10", "PolSBX100", "PolUni10", "PolUni100", "UniSBX10", "UniSBX100", "UniUni10", "UniUni100"), ylab = "Objective value", main = "${problem} - 24h - 30 exec.")
dev.off()};

  open FILE, "> boxplot_allHV_MonoGA_${problem}.R";
  print FILE $script;
  close FILE;

}
