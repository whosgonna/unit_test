package myRand;
use strict;
use warnings;
use Exporter;
###############################################################################
# Lines above are to declare the namespace for this module (library).  The use
# strict and use warnings line are general perl best practices - they enforce 
# lexical name scoping, etc.  Exporter allows this module to indicate which 
# elements (variables, subroutines, etc.) to be pushed into the "main" 
# namespace, meaning that we could call "rand1thru10()" directly, and not have
# to call it as "myRand::bad1thru10" if it is specified below.  Note that this
# line just says to use the "Exporter" module.


###############################################################################
# The next two lines are used to define the specific aspects to be 
# automatically exported to the "main" namespace.  @ISA is a list of the paths
# that perl should search for modules to use, and @EXPORT is the functions to 
# export.  The 'our' keyword is used because these are globablly scoped 
# variables. (use of 'our' is uncommon, but this is one of the situations where
# it is considered acceptable.)
our @ISA    = qw(Exporter);
our @EXPORT = qw(rand1thru10 badrand1thru10);


###############################################################################
# The two subroutines (functions) below are probably quite self explainatory. 
# rand() returns a random fractional number greater than or equal to 0 and less 
# than the value of it's argument.  int() returns the integer portion of the 
# value, thus "int(rand(10))" would return a whole number between zero and 
# nine.  The subroutine 'rand1thru10' adds a 1 to the result, where as the 
# subroutine 'bad1thru10' forgets to add the 1, and is thus something we expect
# to fail (if the goal is to get a whole number between 1 and 10)
sub badrand1thru10 {
	## This will actually return a randum number between 0 and 9.
	my $random = int(rand(10));
	return $random;
}

sub rand1thru10 {
	## This will actually return a randum number between 0 and 9.
	my $random = int(rand(10)) + 1;
	return $random;
}