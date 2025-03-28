#!/usr/bin/perl
use v5.14.0; # Compatible with Programming Perl 4th Edition
use strict;
use warnings;

sub help {
    say "Usage:";
    say "\tperl $0 <command> [options]";
    say "Available Commands:";
    say "\tbuild -> Assemble the static site.";
    exit;
}

if (@ARGV == 0) {
    help;
}

my $command = shift @ARGV;

if ($command eq "build") {
    system("perl ./src/main.pl " . join(" ", @ARGV));
}
else {
    say "Unrecognized command $command";
    help;
}
