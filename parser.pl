#use Data::Dumper;
use List::MoreUtils qw( minmax );
$j=0;
open(fh,"<","result.json") or die $!;
while(my $line = <fh>) {
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
close(fh);
%hash;
for  $idx (0 .. $#keys) {
   push @{ $hash{ $keys[$idx] } }, $values[$idx];
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
    ($mint, $maxt) = minmax @temp;
    ($minum, $maxum) = minmax @umid;
    print(substr(@giorni[$j],12,10)." : \n");
    print("MIN temp  = ".$mint."C \n");
    print("MAX temp  = ".$maxt."C \n");
    print("MEAN temp  = ".substr($tsum/scalar @temp,0,5)."C \n");
    print("MIN um  = ".$minum."% \n");
    print("MAX um = ".$maxum."% \n");
    print("MEAN um  = ".substr($usum/scalar @umid,0,5)."% \n");
    $j++;
      }
  }
