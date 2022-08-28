use List::MoreUtils qw( minmax );
use strict;
my @keys;
my $line;
my @values;
open(my $fh,"<","result.json") or die $!;
while($line = <$fh>) {
  if($line =~ /"date"/){
    push(@keys,$line);
}
  elsif($line =~ /temperatura/){
    push(@values,substr($line,25,7));
}
  elsif($line =~ /umidità/){
    push(@values,substr($line,22,7));
}
}
close($fh);
my $minum;
my $maxum;
my $maxt;
my @temp;
my $maxt;
my @umid;
my $tsum;
my $mint;
my @temp;
my $usum;
my $i;
my @giorni;
my $j=0;
for (@keys){
  if(substr($_,14,8) ne  substr($giorni[$#giorni],14,8) ){
    push(@giorni,$_);
    }
}
  for($i=0;$i<=@values;++$i){
    if(substr($keys[$i],20,2) == substr(@giorni[$j],20,2)){
      if($values[$i] !~ /C/){
  	  $usum+=$values[$i];
	  push(@umid,substr($values[$i],0,-1));
    }
    else{
    push(@temp,substr($values[$i],0,-1));
	$tsum+=$values[$i];
}}
    elsif(substr($keys[$i],20,2) ne substr(@giorni[$j],20,2)){
	    #   open(my $wh,">>","dati.txt") or die $!;
    ($mint, $maxt) = minmax @temp;
    ($minum, $maxum) = minmax @umid;
    print(substr(@giorni[$j],12,10)." : \n");
    print("MIN temp  = ".$mint."C \n");
    print("MAX temp  = ".$maxt."C \n");
    print("MEAN temp  = ".substr($tsum/scalar @temp,0,5)."C \n");
    print("MIN um  = ".$minum."% \n");
    print("MAX um = ".$maxum."% \n");
    print("MEAN um  = ".substr($usum/scalar @umid,0,5)."% \n");
    #close($wh);
    $j++;
      }
  }
