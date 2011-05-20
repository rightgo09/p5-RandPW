use strict;
use Test::More tests => 104;
use RandPW;

sub pw_len {
	my $len = shift;
	my $pw = RandPW::create($len);
	return length($pw);
}

for my $i (4 .. 100) {
	cmp_ok pw_len($i), '==', $i;
}

cmp_ok pw_len(3), '==', 0;
cmp_ok pw_len(2), '==', 0;
cmp_ok pw_len(1), '==', 0;
cmp_ok pw_len(0), '==', 0;
cmp_ok pw_len(-1), '==', 0;

cmp_ok pw_len('string'), '==', 0;

cmp_ok pw_len(undef), '==', 8;

