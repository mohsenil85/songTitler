######################################### 	
#    CSCI 305 - Programming Lab #1		
#										
# Logan Mohseni -01449704 
# mohsenil85@gmail.com 
#										
#########################################

# Replace the string value of the following variable with your name.
my $name = "logan Mohseni";
print "CSCI Lab 1 submitted by $name\n\n";

# Checks for the argument, fail if none given
if($#ARGV != 0) {
    print STDERR "You must specificy the file name as the argument.\n";
    exit 4;
}

# Opens the file and assign it to handle INFILE
open(INFILE, $ARGV[0]) or die "Cannot open $ARGV[0]: $!.\n";


# YOUR VARIABLE DEFINITIONS HERE...
my $firstWord;
my $secondWord;
my $bigram;
my %count;
my %sortedCount;
# This loops through each line of the file
while($line = <INFILE>) {

	chomp $line;
	$line =~ s/^.*<SEP>//; #step 1, grap song title
	$title = $line;
	$title =~ s/(feat|\"|\(|\[|\{|\\|\/|\-|\:|\‘|\+|\=|\*).*$//; #step 2, discard anything after these chars
	$title =~ s/(\_|\?|\¿|\!|\¡|\(|\-|\.|\;|\\|\&|\$|\@|\%)//g;  #step 3, remove unwanted punc
	$title =~ tr/[A-Z]/[a-z]/; #step 4, change to lower case
	my @array = split( ' ', $title );
	for my $i (0 .. $#array) {
    		$firstWord =  $array[$i];
    		$secondWord = $array[($i+1)];
		$bigram= "$firstWord  $secondWord\n";
		$secondWord = $firstWord;
		$count{$bigram}++;
	}#end for i in arr
		

}# end while line in file


#foreach $bigram (sort %count) {
#	print "$count{$bigram} $bigram\n";
#}#end print loop

# Close the file handle
close INFILE; 

# At this point you will have finished processing the song title
# file and have populated your data structure of bigram counts.
print "File parsed. Bigram model built.\n";

print "Type the word you would like to search\n";
chomp ($input = <STDIN>);
sub mcw {
	
	my @sortedArr;
	my @arr;
	foreach $bigram (%count) {
		$thing = "$count{$bigram} $bigram\n";
		push (@arr, (grep {/ $_[0] / } $thing));
	}#end loop
	@sortedArr = sort {$a <=> $b} @arr;
	$lastWord = "$sortedArr[-2] \n";
	$lastWord =~ s/[0-9]*//;
	my @wordArr = split( /\s+/, $lastWord );	
	return  $wordArr[-1];
}

$bob = &mcw($input);
print "$bob\n";

print "20 word song title.  Please enter the starting word\n";
chomp ($input = <STDIN>);
my $songTitle = $input;
for ($i = 0; $i < 20; $i++){

	$songTitle = $songTitle ." ". mcw($input);
	$input = mcw($input);
}

print "$songTitle\n";	
