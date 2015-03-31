package Catmandu::Fix::isbn;

use Catmandu::Sane;
use Business::ISBN;
use Moo;
use Catmandu::Fix::Has;

has path => (fix_arg => 1);

with 'Catmandu::Fix::SimpleGetValue';

sub emit_value {
  my ($self, $var) = @_;
  "${var} = Business::ISBN->new(${var})->as_string if is_value(${var});";
}

=head1 NAME

Catmandu::Fix::isbn - normalize the isbn value of a key

=head1 SYNOPSIS

# Normalize the ISBN value of foo. E.g. foo => ''
isbn(foo) # foo => ''

=head1 SEE ALSO

L<Catmandu::Fix>

=cut

1;
