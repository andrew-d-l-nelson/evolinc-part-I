 #!/usr/bin/perl
    use strict;
    use warnings;
    my %initialcount;
	my $initial = $ARGV[0] or die;
	my $secondfile = $ARGV[1] or die;
	my $thirdfile = $ARGV[2] or die;
	my $fourthfile = $ARGV[3] or die;
	my $fifthfile = $ARGV[4] or die;
	my $sixthfile = $ARGV[5] or die;
	my @nums;
    open my $initialfh, '<', $initial or die "Could not open '$initial' $!";
    while (my $line = <$initialfh>) {
        chomp $line;
        foreach my $str ($line =~ /\>/g) {
            $initialcount{$str}++;
        }
    }
     
    foreach my $str (sort keys %initialcount) {
        push @nums, "Initial RNAs"."\t".$initialcount{$str}."\n";
    }
	  my %secondcount;
    open my $secondfh, '<', $secondfile or die "Could not open '$secondfile' $!";
    while (my $line = <$secondfh>) {
        chomp $line;
        foreach my $str ($line =~ /\>/g) {
            $secondcount{$str}++;
        }
    }
     
    foreach my $str (sort keys %secondcount) {
        push @nums, "RNAs after filtering for coding potential"."\t".$secondcount{$str}."\n";
    }
	my %thirdcount;
    open my $thirdfh, '<', $thirdfile or die "Could not open '$thirdfile' $!";
    while (my $line = <$thirdfh>) {
        chomp $line;
        foreach my $str ($line =~ /\>/g) {
            $thirdcount{$str}++;
        }
    }
     
    foreach my $str (sort keys %thirdcount) {
        push @nums, "RNAs after TE filtering"."\t".$thirdcount{$str}."\n";
    }
	my %fourthcount;
    open my $fourthfh, '<', $fourthfile or die "Could not open '$fourthfile' $!";
    while (my $line = <$fourthfh>) {
        chomp $line;
        foreach my $str ($line =~ /\>/g) {
            $fourthcount{$str}++;
        }
    }
     
    foreach my $str (sort keys %fourthcount) {
        push @nums, "Non-redundant RNAs filter 1"."\t".$fourthcount{$str}."\n";
    }
	my %fifthcount;
    open my $fifthfh, '<', $fifthfile or die "Could not open '$fifthfile' $!";
    while (my $line = <$fifthfh>) {
        chomp $line;
        foreach my $str ($line =~ /\>/g) {
            $fifthcount{$str}++;
        }
    }
     
    foreach my $str (sort keys %fifthcount) {
        push @nums, "Non-redundant RNAs filter 2"."\t".$fifthcount{$str}."\n";
    }
	my %sixthcount;
    open my $sixthfh, '<', $sixthfile or die "Could not open '$sixthfile' $!";
    while (my $line = <$sixthfh>) {
        chomp $line;
        foreach my $str ($line =~ /\>/g) {
            $sixthcount{$str}++;
        }
    }
     
    foreach my $str (sort keys %sixthcount) {
        push @nums, "Final lincRNA count"."\t".$sixthcount{$str}."\n";
    }
	print @nums;
	
	#transcripts_u.fa initial "u" transcripts
	#longest_orfs.cds.genes.not.genes.fa after ORF filter
	#lincRNA.genes.fa after TEDB filter
	#lincRNA_genes_non_redundant.fa after checked for redundancy
	#lincRNA_non_redundant_filtered.genes.fa after being checked against protein DB
	#Final_filtered_lincRNAs.fasta final
