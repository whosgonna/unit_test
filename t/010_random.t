## standard boilerplate for perl scripts
use strict;
use warnings;
use myRand;
use Test::More;




my $itr = 1000;

is( 
	qt($itr),
	0,
	"Run $itr iterations and check for out of range."
);


done_testing;


sub qt {
	my $itr = shift;
	for my $num (1 .. $itr) {
		my $num = badrand1thru10();
		if ($num < 1 or $num > 10) {
			return 1;
		}
	}
	return 0;
}