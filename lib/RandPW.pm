package RandPW;
use strict;
use warnings;
use Scalar::Util qw/ looks_like_number /;
use List::Util qw/ shuffle /;
use 5.010;

my $DEFAULT_PASSWORD_LENGTH = 8;

my @c = ('a'..'z'); # lower case
my @C = ('A'..'Z'); # UPPER CASE
my @d = ('0'..'9'); # a digit
my @sym = ('!','#','$','%','&','@','?','*','+','-'); # symbol
my $_qr_sym_join = join(q{}, @sym);

my %qr = (
  c   => qr/[a-z]/,
  C   => qr/[A-Z]/,
  d   => qr/\d/,
  sym => qr/[$_qr_sym_join]/,
);

my $type_count = keys %qr;

my @passowrd_character_elements = shuffle(@c, @C, @d, @sym);

sub create {
  my $len = shift // $DEFAULT_PASSWORD_LENGTH;
  return '' unless is_pw_natural_number($len);

  MAKE_PASSWORD:
  while (1) {
    my $pw;
    $pw .= $passowrd_character_elements[int(rand(@passowrd_character_elements))]
      for 1 .. $len;

    # require all type char
    unless (     $pw =~ $qr{c} and $pw =~ $qr{C}
             and $pw =~ $qr{d} and $pw =~ $qr{sym})
    {
      redo MAKE_PASSWORD;
    }

    return $pw;
  }
}

sub is_pw_natural_number {
	my $w = shift;
	if (looks_like_number($w)
	    and (int($w) == $w)
		 and ($type_count <= $w))
	{
		return 1;
	}
	return;
}

1;
__END__

