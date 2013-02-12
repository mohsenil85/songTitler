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


# This loops through each line of the file
while($line = <INFILE>) {

	chomp $line;
	$line =~ s/^.*<SEP>//; #step 1, grap song title
	$title = $line;
	$title =~ s/(feat|\"|\(|\[|\{|\\|\/|\-|\:|\‘|\+|\=|\*).*$//; #step 2, discard anything after these chars
	$title =~ s/(\_|\?|\¿|\!|\¡|\.|\;|\|\&|\$|\@|\%)//g;  #step 3, remove unwanted punc
	$title =~ tr/[A-Z]/[a-z]/; #step 4, change to lower case
	my @array = split( ' ', $title );
	foreach $word (@array){
		$i = 0;
		$bigram = $array[i] . " " . $array[i+1];
		$i = $i + 1;
		print "bigram = $bigram\n";    

		#print "$word \n";
		#print "$array[$word] $array[$word+1]\n";
		$bigram = "$word2 $word1";
		$word2 = $word1;
		$count{$bigram}++;
	}
	print "end arr\n\n";
#foreach $bigram (sort numerically keys %count) {
#print "$count{$bigram} $bigram\n";
#}

#sub numerically { # compare two words numerically
#$count{$b} <=> $count{$a}; # decreasing order
# $count{$b} <=> $count{$a}; # increasing order
#} 
		
}# end while line in file

# Close the file handle
close INFILE; 

# At this point you will have finished processing the song title
# file and have populated your data structure of bigram counts.
print "File parsed. Bigram model built.\n";

# MORE OF YOUR CODE HERE....
