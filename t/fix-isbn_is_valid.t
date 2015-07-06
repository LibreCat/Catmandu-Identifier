#!/usr/bin/env perl

use strict;
use Test::More;
use Test::Exception;

my $pkg;
BEGIN {
  $pkg = 'Catmandu::Fix::isbn_is_valid';
  use_ok $pkg;
}
require_ok $pkg;

dies_ok { $pkg->new() } "required argument";
lives_ok { $pkg->new('isbn') } "path required";

is_deeply
  $pkg->new('isbn_path')->fix({isbn_path => '1565922573'}),
  {isbn_path => 1},
  "is valid 1";

is_deeply
  $pkg->new('isbn_path')->fix({isbn_path => '1565922575'}),
  {isbn_path => 0},
  "is valid 0";

is_deeply
    $pkg->new('identifier.*.isbn')->fix(
    {identifier => [{isbn => '1565922573'}, {isbn => '9780596527247'}]}),
    {identifier => [
      {isbn => '1'},
      {isbn => '0'},
    ]},
    "normalize isbn with complex path";


done_testing;
