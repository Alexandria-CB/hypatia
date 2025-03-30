use v5.14.0; # Compatible with Programming Perl 4th Edition
use strict;
use warnings;
use DateTime;

use Config::IniFiles;
use Getopt::Long;
use File::Path qw( make_path );

my $dt = DateTime->now;
my $now = join("_", $dt->ymd, $dt->hms);
my $debug;
my $help;
my $path = "./";
my $name = $now;

GetOptions(
    "path=s" => \$path,
    "name=s" => \$name,
    "debug"  => \$debug,
    "help"   => \$help);

if ($help) {
    sub help {
        say "Hypatia Post Creation Utility";
        say "Usage: perl hyp.pl post [options]";
        say "Options:";
        say "\t -p, --path --> Set the folder relative to content to place the post.";
        say "\t -n, --name --> Set the name of the post.";
        say "\t -d, --debug -> Set debug mode.";
        say "\t -h, --help --> Print this help message and exit.";
        exit;
    }

    help;
}

my $cfg = Config::IniFiles->new( -file => "./config.ini" );
my $content_root = $cfg->val("General", "content", "./srcwww/content/");

if ($debug) {
    say "Creating blank post $name in folder $path with timestamp $now";
}

my $full_path = join("/", $content_root, $path, $name);
make_path($full_path) or die "Failed to create path $full_path";
my $ini_file_name = join("/", $full_path, $name . ".ini");
my $md_file_name = join("/", $full_path, $name . ".md");

my $default_ini = "; $name post metadata
name = $name
date = $now
tags = 
";

open my $ini_file, ">", $ini_file_name or die "Failed to open $ini_file_name";
print {$ini_file} $default_ini;
close $ini_file;

open my $md_file, ">", $md_file_name or die "Failed to open $md_file_name";
close $md_file;