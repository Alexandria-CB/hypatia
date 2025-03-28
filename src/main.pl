use v5.14.0; # Compatible with Programming Perl 4th Edition
use strict;
use warnings;
use FindBin qw($RealBin);
use lib $RealBin;

use Config::IniFiles;

use Hypatia;

my $cfg = Config::IniFiles->new( -file => "./config.ini" );
my $hyp = new Hypatia(
    $cfg->val("General", "root", "./root/"),
    $cfg->val("General", "templates", "./srcwww/templates/"),
    $cfg->val("General", "content", "./srcwww/content/"),
    $cfg->val("General", "css", "./srcwww/css/")
);

$hyp->hello();