#!/usr/bin/perl

use strict;
use warnings;

use Text::CSV;

my $csv = Text::CSV->new();

while ( my $line = <DATA> ) {
  if ( $csv->parse( $line )) {
    my $str = join '|' , $csv->fields();
    print "|$str|\n";
  }
}
