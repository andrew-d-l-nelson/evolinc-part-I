#!/usr/bin/perl -w
use strict;                  
use warnings;

my ($In, $Out) = @ARGV;
	open (GTFIN, "<".$In) ||
	die "Can not open BLAST input file.$In.\n";
    open (GTFOUT, ">".$Out) ||
		die "Can not open GFF ouput file.$Out.\n";
    while (<GTFIN>) {
	my ($scaffold, $program, $type, $lend, 
	    $rend, $value, $strand, $empty, $morevalues) = split(/\t/);
	my $newlend = $lend - 200;
	my $newrend = $lend;
	if ($newlend < 0) { next; }
	if ($morevalues =~ /class_code "u"/) {
	print GTFOUT
	    $scaffold."\t".
		$program."\t".
		$type."\t".
		$newlend."\t".
		$newrend."\t".
	    $value."\t".
	    $strand."\t".
	    $empty."\t".
	    $morevalues;
	}
	}
