#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use List::Util qw (sum);

die "Incorrect number of arguments: fileName numberRuns stepSize finalStep" if (@ARGV != 4);

my ($fileName, $numberRuns, $stepSize, $finalStep) = @ARGV;

my $valueHash;

for my $currentRun (0..$numberRuns - 1) {

  open EVOF, "$fileName.$currentRun" or die "File $fileName.$currentRun cannot be opened";

  while (<EVOF>) {
    chomp;
    my ($currentStep, $previousStep);

    if (/best:\s+(\d+.\d+)(.*)?time:\s+(\d+)/) {
      $currentStep = int($3 / $stepSize) * $stepSize;
      $valueHash->{$currentStep}[$currentRun] = $1;
      $previousStep = $currentStep - $stepSize;
    }
    elsif ((/Fitness:\s+(\d+.\d+)/) && (!defined($valueHash->{$finalStep}[$currentRun]))) {
      $valueHash->{$finalStep}[$currentRun] = $1;
      $previousStep = $finalStep - $stepSize;
    }

    # Updating those checkpoints that have been assigned no value
    if (defined($previousStep)) {
      my $needForUpdate = 0;

      while (!defined($valueHash->{$previousStep}[$currentRun]) && ($previousStep > 0)) {
        $needForUpdate++;
        $previousStep -= $stepSize;
      }

      $previousStep += $stepSize;

      for (1..$needForUpdate) {
        $valueHash->{$previousStep}[$currentRun] = $valueHash->{$previousStep - $stepSize}[$currentRun];
        $previousStep += $stepSize;
      }
    }
  }
  close EVOF;
}

#print Dumper($valueHash);

# Printing mean values at each checkpoint
for (my $currentStep = $stepSize; $currentStep <= $finalStep; $currentStep += $stepSize) {
  my $meanValue = (sum @{$valueHash->{$currentStep}}) / $numberRuns;
  print "$currentStep $meanValue\n";
}
