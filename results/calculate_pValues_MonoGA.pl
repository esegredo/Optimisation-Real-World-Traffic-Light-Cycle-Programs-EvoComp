#!/usr/bin/perl
use warnings;
use strict;

my @init_A = qw {PolUni10 PolUni100 PolSBX10 PolSBX100 UniUni10 UniUni100 UniSBX10 UniSBX100};
my @init_B = qw {PolUni10 PolUni100 PolSBX10 PolSBX100 UniUni10 UniUni100 UniSBX10 UniSBX100};
my @problems = qw {Berlin};
my $stat;
my $pValues;

for my $problem (@problems) {
  for (my $i = 0; $i < @init_A; $i++) {
    for (my $j = $i + 1; $j < @init_B; $j++) {
      my $file_A = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_Uniform_10_86400_86400.allHV" if ($init_A[$i] eq "PolUni10");
      $file_A = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_Uniform_100_86400_86400.allHV" if ($init_A[$i] eq "PolUni100");
      $file_A = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_SBX_10_86400_86400.allHV" if ($init_A[$i] eq "PolSBX10");
      $file_A = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_SBX_100_86400_86400.allHV" if ($init_A[$i] eq "PolSBX100");
      $file_A = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_Uniform_10_86400_86400.allHV" if ($init_A[$i] eq "UniUni10");
      $file_A = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_Uniform_100_86400_86400.allHV" if ($init_A[$i] eq "UniUni100");
      $file_A = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_SBX_10_86400_86400.allHV" if ($init_A[$i] eq "UniSBX10");
      $file_A = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_SBX_100_86400_86400.allHV" if ($init_A[$i] eq "UniSBX100");
      
      my $file_B = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_Uniform_10_86400_86400.allHV" if ($init_B[$j] eq "PolUni10");
      $file_B = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_Uniform_100_86400_86400.allHV" if ($init_B[$j] eq "PolUni100");
      $file_B = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_SBX_10_86400_86400.allHV" if ($init_B[$j] eq "PolSBX10");
      $file_B = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Pol_Crossover_SBX_100_86400_86400.allHV" if ($init_B[$j] eq "PolSBX100");
      $file_B = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_Uniform_10_86400_86400.allHV" if ($init_B[$j] eq "UniUni10");
      $file_B = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_Uniform_100_86400_86400.allHV" if ($init_B[$j] eq "UniUni100");
      $file_B = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_SBX_10_86400_86400.allHV" if ($init_B[$j] eq "UniSBX10");
      $file_B = "Centella_MonoGA_Sumo_Preliminary_${problem}_Mutate_Uniform_Crossover_SBX_100_86400_86400.allHV" if ($init_B[$j] eq "UniSBX100");

      my @result = `./statisticalTests_old.pl 30 $file_A $file_B`;
      my ($mean1, $mean2, $median1, $median2, $sd1, $sd2, $pValue, $eSize) = split / /, $result[0];

      if (($i == 0) && ($j == 1)) {
        $stat->{$problem}{$init_A[$i]} = [$mean1, $median1, $sd1];
      }

      if ($i == 0) {
        $stat->{$problem}{$init_B[$j]} = [$mean2, $median2, $sd2];
      }

      if ($pValue < 0.05) {
        if (($mean1 < $mean2) && ($median1 < $median2)) {
          $pValues->{$problem}{$init_A[$i]}{$init_B[$j]} = [$pValue, '$\uparrow$'];
        }
        elsif (($mean1 > $mean2) && ($median1 > $median2)) {
          $pValues->{$problem}{$init_A[$i]}{$init_B[$j]} = [$pValue, '$\downarrow$'];
        }
      }
      else {
        $pValues->{$problem}{$init_A[$i]}{$init_B[$j]} = [$pValue, '$\leftrightarrow$'];
      }
    }
  }
}

for my $problem (@problems) {
  my $mean_min   = $stat->{$problem}{$init_A[0]}[0];
  my $median_min = $stat->{$problem}{$init_A[0]}[1];
  my $mean_alg = $init_A[0];
  my $median_alg = $init_A[0];
  my $line = "${problem}";

  for my $initA (@init_A) {
    if ($stat->{$problem}{$initA}[0] < $mean_min) {
      $mean_min = $stat->{$problem}{$initA}[0];
      $mean_alg = $initA;
    }
    if ($stat->{$problem}{$initA}[1] < $median_min) {
      $median_min = $stat->{$problem}{$initA}[1];
      $median_alg = $initA;
    }
  }

  for my $initA (@init_A) {
    if ($initA eq $mean_alg) {
      $line .= sprintf(' & {\\bf %.3e}', $stat->{$problem}{$initA}[0]);
    }
    else {
      $line .= sprintf(' & %.3e', $stat->{$problem}{$initA}[0]);
    }

    if ($initA eq $median_alg) {
      $line .= sprintf(' & {\\bf %.3e}', $stat->{$problem}{$initA}[1]);
    }
    else {
      $line .= sprintf(' & %.3e', $stat->{$problem}{$initA}[1]);
    }
      
    $line .= sprintf(' & %.3e', $stat->{$problem}{$initA}[2]);
  }
  $line .= ' \\\\';
  print "$line\n";
}

print "\n\n";

for my $problem (@problems) {
  my $line = "${problem}";
  for (my $i = 0; $i < @init_A; $i++) {
    for (my $j = $i + 1; $j < @init_B; $j++) {
      my $initA = $init_A[$i];
      my $initB = $init_B[$j];
      if ($pValues->{$problem}{$initA}{$initB}[1] ne '$\leftrightarrow$') {
       $line .= sprintf(' & {\\bf %.3e} & %s', $pValues->{$problem}{$initA}{$initB}[0], $pValues->{$problem}{$initA}{$initB}[1]);
      }
      else {
       $line .= sprintf(' & %.3e & %s', $pValues->{$problem}{$initA}{$initB}[0], $pValues->{$problem}{$initA}{$initB}[1]);
      }
    }
  }
  $line .= ' \\\\';
  print "$line\n";
}
