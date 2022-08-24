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
  #guarda solo il giorno,poi dovrei aggiustarlo e fargli guardare anche il mese e l'anno
  if(substr($_,20,2) ne  substr($giorni[$#giorni],20,2) ){
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
    open(my $wh,">>","dati.tsv") or die $!;
    ($mint, $maxt) = minmax @temp;
    ($minum, $maxum) = minmax @umid;
    print($wh substr(@giorni[$j],12,10)." : \n");
    print($wh "MIN temp  = ".$mint."C \n");
    print($wh "MAX temp  = ".$maxt."C \n");
    print($wh "MEAN temp  = ".substr($tsum/scalar @temp,0,5)."C \n");
    print($wh "MIN um  = ".$minum."% \n");
    print($wh "MAX um = ".$maxum."% \n");
    print($wh "MEAN um  = ".substr($usum/scalar @umid,0,5)."% \n");
    close($wh);
    $j++;
      }
  }
