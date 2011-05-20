use strict;
use Test::More;
use RandPW;

my $count = 10_000;

plan tests => $count * 4;

my @sym = ('!','#','$','%','&','@','?','*','+','-');
my $_qr_sym_join = join(q{}, @sym);

for my $i (1 .. 10_000) {
	my $pw = RandPW::create();

	like $pw, qr/[a-z]/          , 'lower case';
	like $pw, qr/[A-Z]/          , 'UPPER CASE';
	like $pw, qr/\d/             , 'Number'    ;
	like $pw, qr/[$_qr_sym_join]/, 'Symbol'    ;
}

