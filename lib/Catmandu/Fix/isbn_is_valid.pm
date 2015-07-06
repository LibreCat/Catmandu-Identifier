package Catmandu::Fix::isbn_is_valid;

use Catmandu::Sane;
use Business::ISBN;
use Moo;
use Catmandu::Fix::Has;

has path => (fix_arg => 1);

with 'Catmandu::Fix::SimpleGetValue';

sub emit_value {
  my ($self, $var) = @_;

  "${var} = Business::ISBN->new(${var})->is_valid || 0 if is_value(${var});";

}

=head1 NAME

Catmandu::Fix::isbn_is_valid - checks isbn value

=head1 SYNOPSIS

  # Checks ISBN value of isbn_field.
  # e.g. isbn_field => '1565922573'

  isbn_is_valid(isbn_field) # isbn_field => '1'

  # e.g. isbn_field => '1565922575'

  isbn_is_valid(isbn_field) # isbn_field => '0'

=head1 SEE ALSO

L<Catmandu::Fix>, L<Catmandu::Fix::isbn10>, L<Catmandu::Fix::isbn13>

=cut

1;
