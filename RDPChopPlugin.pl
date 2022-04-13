                                                                     
                                                                     
                                                                     
                                             
#!/local/bin/perl -w

# =====================================================================
# Giri Narasimhan
# Bioinformatics Research Group (BioRG)
# Florida International University
# 29 June 2008
# Modified:	August 2008, Gisela Gonzalez
# ======================================================================
# This program chops up a large fasta file into smaller pieces.
# The output file names are hardwired to have a common prefix. 
# Change this for your needs. 
# This program chops it up so that each file has 50000 fasta sequences.
# Change this also for you needs. 
# Alternatively, you can modify the program so that all these are provided
# by the command line
# Sample command:
#          perl ChopUp.pl inputfile.fasta
# 
# ======================================================================

use strict;

use Bio::SeqIO;
my $fin;
my $in;

use lib '.';
use PerlPluMA;

sub input {
$fin  = @_[0]; 
chomp $fin;    # name of input file

}

sub run {
$in = Bio::SeqIO->newFh(-file => "<$fin", -format => 'fasta'); 
}

sub output {
	my $cnt = 1;
my $s = "";
while () {
    my $name = PerlPluMA::prefix.$cnt."/release10_bac";
    my $out = Bio::SeqIO->newFh ( -file   => ">$name",
                              -format => 'fasta' );
    for my $i (1 .. 50000) {
	if ($s = <$in>) {
	    print $out $s;
	} else {
            system("cp ".PerlPluMA::prefix."/1/release10_bac ".PerlPluMA::prefix);
	    exit;
	}
    }
    $cnt++;
}
}
#exit;
