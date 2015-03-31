package Catmandu::Fix::issn;

use Catmandu::Sane;
use Business::ISSN;
use Moo;
use Catmandu::Fix::Has;

has path => (fix_arg => 1);

with 'Catmandu::Fix::SimpleGetValue';

#has isbn_obj => (is => 'lazy');

#sub _build_isbn_obj {
#  my ($self, $isbn) = @_;
#  Business::ISBN->new($isbn);
#}

sub emit_value {
  my ($self, $var) = @_;
  "${var} = Business::ISSN->new(${var})->as_string if is_value(${var});";
}

=head1 NAME

Catmandu::Fix::issn - normalize the issn value of a key

=head1 SYNOPSIS

# Normalize the ISSN value of foo. E.g. foo => ''
issn(foo) # foo => ''

=head1 SEE ALSO

L<Catmandu::Fix>

=cut

1;
