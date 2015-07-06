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

1;
