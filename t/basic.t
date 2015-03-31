#!/usr/bin/env perl

use strict;
use Test::More;

my $pkg;
BEGIN {
  $pkg = 'Catmandu::Identifier';
  use_ok $pkg;
}

done_testing;
