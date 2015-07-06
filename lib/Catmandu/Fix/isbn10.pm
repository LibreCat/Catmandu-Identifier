package Catmandu::Fix::isbn10;

use Catmandu::Sane;
use Business::ISBN;
use Moo;
use Catmandu::Fix::Has;

has path => (fix_arg => 1);

with 'Catmandu::Fix::SimpleGetValue';

sub emit_value {
  my ($self, $var) = @_;

  "${var} = Business::ISBN->new(${var})->as_isbn10->as_string if is_value(${var});";

}

1;
