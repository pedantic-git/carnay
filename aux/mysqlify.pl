#!/usr/bin/env perl

use strict;
use DBI;
use File::Basename;
use Text::CSV;

my $file = shift(@ARGV) or die "Specify file";
my $table = basename($file, '.csv');

open my $fh, $file or die $!;
my $dbh = DBI->connect('DBI:mysql:naptan', 'naptan', 'naptan', {RaiseError => 1});
my $csv = Text::CSV->new({binary => 1});

my $header_row = $csv->getline($fh);
$dbh->do("DROP TABLE IF EXISTS $table");
$dbh->do(sprintf "CREATE TABLE $table (%s)", join(',', map {"$_ varchar(255)"} @$header_row));

while (my $row = $csv->getline($fh)) {
	my $sql = sprintf "INSERT INTO $table VALUES (%s)", join(',', ('?') x @$row);
	$dbh->do($sql, undef, @$row);
}