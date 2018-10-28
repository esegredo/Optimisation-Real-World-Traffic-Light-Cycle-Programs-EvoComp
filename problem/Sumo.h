/***********************************************************************************
 * AUTHOR 
 *   - Eduardo Segredo
 * 
 * LAST MODIFIED
 *    October 2018
 * ********************************************************************************/

#ifndef __SUMO__
#define __SUMO__

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>
#include <math.h>
#include <sys/wait.h>

// These two header files are located at sumo-wrapper directory
#include "cInstance.h"
#include "simpleXMLParser.h"

#include "Individual.h"

class Sumo : public Individual {
public:

	// Initialisation method
	bool init (const vector<string> &params);

	// Evaluation
	void evaluate (void);

	// Ranges of decision variables
	double inline getMaximum(const int i) const { return 60; }
	double inline getMinimum(const int i) const { return 5; }

  // Minimisation problem
	unsigned int inline getOptDirection(const int i) const { return MINIMIZE; }

	// Clone
	Individual* clone (void) const;

  // Print
  void print(ostream &os) const;

private:

	// Constants: number of objective functions
	static const int NOBJ  = 1;

  // Contains the problem instance
  cInstance instance;

  // Contain the command to be executed, the tl file name and the results file name
  string command, tlFile, resultsFile;

  // Contain the mutation and crossover operators to be used
  string mut_op, cross_op;

  // Executes the simulator
  string execCommandPipe(string command);

  // Dependent mutation and crossover operators
  void dependentMutation(double pm);
  void dependentCrossover(Individual* ind);

  // Random generation of an individual
  void restart(void);
  
  // This method repairs solutions after executing the initialisation, mutation and/or crossover operators
  void repair(void);

  // Transforms a solution encoded by floating point numbers to a solution represented by integers
  void doubleToIntSolution(void);

  // This method checks if a particular phase only contains "y"
  bool areAllYellow(string phase);

  // Auxiliary functions
  void writeSolutionFile();
  double readFitnessFile();
};

#endif
