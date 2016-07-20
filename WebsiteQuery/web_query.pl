#!/usr/bin/perl -w

use strict;

my $file = "results";

open OUTFILE, ">>", $file or die "Error opening $file: $!";

my $sec, my $min, my $hour, my $mday,my $mon,my $year, my $wday, my $yday, my $isdst;
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();

printf OUTFILE "%02d/%02d/20%02d %02d:%02d:%02d | ", $mon+1, $mday, $year-100, $hour, $min, $sec;

use LWP;
my $browser = LWP::UserAgent->new;
my $url = 'http://checkip.dyndns.org';
my $response = $browser->get($url);

die "Cannot parse the URL $url: ", $response->status_line unless $response->is_success;

if ($response->content =~ /(\d+\.\d+\.\d+.\d+)/) {
	print OUTFILE "$1\n";
}

close OUTFILE;
