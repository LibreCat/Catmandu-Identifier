#!/usr/bin/env perl

use strict;
use Test::More;

my $pkg;
BEGIN {
  $pkg = 'Catmandu::Fix::isbn';
  use_ok $pkg;
}
require_ok $pkg;

is_deeply
  $pkg->new('isbn_path')->fix({isbn_path => '1565922573'}),
  { isbn_path => '1-56592-257-3'},
  "normalize isbn";

is_deeply
  $pkg->new('identifier.*.isbn')->fix( {identifier => [{isbn => '9781565922570'},{isbn => '0596527241'}]} ),
  {identifier => [{isbn => '978-1-56592-257-0'},{isbn => '0-596-52724-1'}]},
  "normalize isbn with complex path";

done_testing;
