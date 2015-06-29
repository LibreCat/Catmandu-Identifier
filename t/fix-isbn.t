#!/usr/bin/env perl

use strict;
use Test::More;
use Test::Exception;

my $pkg;
BEGIN {
  $pkg = 'Catmandu::Fix::isbn';
  use_ok $pkg;
}
require_ok $pkg;

dies_ok { $pkg->new() } "required argument";
lives_ok { $pkg->new('isbn') } "path required";
lives_ok { $pkg->new('isbn', length => 10) } "isbn 10 or 13";
lives_ok { $pkg->new('isbn', length => 13) } "isbn 10 or 13";
dies_ok { $pkg->new('isbn', length => 15) } "isbn 10 or 13";

is_deeply
  $pkg->new('isbn_path')->fix({isbn_path => '1565922573'}),
  { isbn_path => '1-56592-257-3'},
  "normalize isbn 10";

is_deeply
  $pkg->new('identifier.*.isbn')->fix( {identifier => [{isbn => '9781565922570'},{isbn => '0596527241'}]} ),
  {identifier => [{isbn => '1-56592-257-3'},{isbn => '0-596-52724-1'}]},
  "normalize isbn 10 with complex path";

is_deeply
  $pkg->new('isbn_path', length => 10)->fix({isbn_path => '978-1-56592-257-0'}),
  { isbn_path => '1-56592-257-3'},
  "normalize isbn 10 again";

is_deeply
  $pkg->new('isbn_path', length => 13)->fix({isbn_path => '1565922573'}),
  { isbn_path => '978-1-56592-257-0'},
  "normalize isbn 13";

  # is_deeply
  #   $pkg->new('identifier.*.isbn',length => 13)->fix(
  #   {identifier => [{isbn => '1565922573'}, {isbn => '9780596527241'}] }),
  #   {identifier => [
  #     {isbn => '978-1-56592-257-0'},
  #     {isbn => '978-0-596-52724-1'},
  #   ]},
  #   "normalize isbn with complex path";


done_testing;
