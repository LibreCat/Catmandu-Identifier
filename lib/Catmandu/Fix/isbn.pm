package Catmandu::Fix::isbn;

use Catmandu::Sane;
use Business::ISBN;
use Moo;
use Catmandu::Fix::Has;

has path => (fix_arg => 1);
has length => (fix_opt => 1, default => sub {10});

sub BUILD {
  my $self = shift;
  ($self->length != 10 && $self->length != 13)
    && ( Catmandu::BadArg->throw("Second optional argument length must be either 10 or 13.\n") );
}

with 'Catmandu::Fix::SimpleGetValue';

sub emit_value {
  my ($self, $var) = @_;

  my $len = $self->length;
  if ($len == 10) {
    "${var} = Business::ISBN->new(${var})->as_isbn10->as_string if is_value(${var});";
  } else {
    "${var} = Business::ISBN->new(${var})->as_isbn13->as_string if is_value(${var});";
  }
}

=head1 NAME

Catmandu::Fix::isbn - normalize the isbn value of a key

=head1 SYNOPSIS

  # Normalize the ISBN value of isbn_field.
  # e.g. isbn_field => '1565922573'

  isbn(isbn_field) # isbn_field => '1-56592-257-3'

  # same as

  isbn(isbn_field, 10) # isbn_field => '1-56592-257-3'

  # isbn in 13 digits form

  isbn(isbn_field, 13) # isbn_field => '978-1-56592-257-0'

=head1 SEE ALSO

L<Catmandu::Fix>

=cut

1;

__END__

use Catmandu::Sane;
use Business::ISBN;
use Moo;
use Catmandu::Fix::Has;

has path => (fix_arg => 1);
has length => (fix_arg => 1, default => sub{ 10 });
has obj => (is => 'lazy');

with 'Catmandu::Fix::SimpleGetValue';

sub emit_value {
  my ($self, $var) = @_;
  my $len = $self->length;

  if($len == 10) {
    return "${var} = Business::ISBN->new(${var})->as_isbn10->as_string if is_value(${var});";
  } else {
    return "${var} = Business::ISBN->new(${var})->as_isbn13->as_string if is_value(${var});";
  }
}
