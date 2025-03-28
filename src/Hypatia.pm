package Hypatia;

use v5.14.0;
use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {
        root=>shift,
        templates=>shift,
        content=>shift,
        css=>shift
    };
    return bless $self, $class;
}

sub hello {
    my $self = shift;
    say "Hello, world!";
    say "Root is $self->{root}";
}

1;