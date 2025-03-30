package Hypatia;

use v5.14.0;
use strict;
use warnings;

use Template;
use Text::Markdown;
use Config::IniFiles;

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

sub process_template {
    my $self = shift;
    my $path = shift;
    my $vars = shift;

    my $template = Template->new();
    #$template->process($file, $vars);

}

1;