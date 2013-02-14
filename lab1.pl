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
#my %bigram;
my $bigram;
my %count;
#my $count;
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
		$bigram= "$firstWord  $secondWord";
		$secondWord = $firstWord;
		$count{$bigram}++;
	}#end for i in arr
	while (($key, $value) = each(%count)){
     		print $key.", ".$value."\n\n";
	}

		
}# end while line in file

# Close the file handle
close INFILE; 

# At this point you will have finished processing the song title
# file and have populated your data structure of bigram counts.
print "File parsed. Bigram model built.\n";

# MORE OF YOUR CODE HERE....
