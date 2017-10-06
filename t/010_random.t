## standard boilerplate for perl scripts
use strict;
use warnings;
use myRand;
use Test::More;




my $itr = 1000;


is( 
	good_test($itr),
	0,
	"Run $itr iterations and check for out of range."
);

is( 
	bad_test($itr),
	0,
	"Run $itr iterations and check for out of range. (expected to fail as an example)"
);




done_testing;


sub good_test {
	my $itr = shift;
	for my $num (1 .. $itr) {
		my $num = rand1thru10();
		if ($num < 1 or $num > 10) {
			return 1;
		}
	}
	return 0;
}

sub bad_test {
	my $itr = shift;
	for my $num (1 .. $itr) {
		my $num = badrand1thru10();
		if ($num < 1 or $num > 10) {
			return 1;
		}
	}
	return 0;
}