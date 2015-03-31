#!/usr/bin/env perl

use strict;
use Test::More;

my $pkg;
BEGIN {
  $pkg = 'Catmandu::Fix::issn';
  use_ok $pkg;
}
require_ok $pkg;

is_deeply
  $pkg->new('issn')->fix({issn => '1553667x'}),
  {issn => '1553-667X'},
  "normalize issn";

is_deeply
  $pkg->new('identifier.*.issn')->fix( {identifier => [{issn => '1553667X'},{issn => '0355-4325'}]} ),
  {identifier => [{issn => '1553-667X'},{issn => '0355-4325'}]},
  "normalize issn with complex path";

done_testing;
