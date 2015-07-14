package Catmandu::Identifier;

use strict;
our $VERSION = '0.01';

1;
__END__

=encoding utf-8

=head1 NAME

Catmandu::Identifier - Namespace for handling/fixing identifier, e.g. ISBN, ISSN

=begin markdown

# STATUS

[![Build Status](https://travis-ci.org/LibreCat/Catmandu-Identifier.svg?branch=master)](https://travis-ci.org/LibreCat/Catmandu-Identifier)
[![Coverage](https://coveralls.io/repos/LibreCat/Catmandu-Identifier/badge.png?branch=master)](https://coveralls.io/r/LibreCat/Catmandu-Identifier)
[![CPANTS kwalitee](http://cpants.cpanauthors.org/dist/Catmandu-Identifier.png)](http://cpants.cpanauthors.org/dist/Catmandu-Identifier)

=end markdown

=head1 MODULES

=over

=item * L<Catmandu::Fix::isbn10>

=item * L<Catmandu::Fix::isbn13>

=item * L<Catmandu::Fix::isbn_is_valid>

=item * L<Catmandu::Fix::issn>

=back

=head1 AUTHOR

Vitali Peil

=head2 CONTRIBUTOR

Patrick Hochstenbach

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Catmandu::Fix>

=cut
