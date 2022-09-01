<?php
function mean($array){
	return number_format(array_sum($array)/count($array), 2);
}
$list = json_decode(file_get_contents("result.json"), true);
$lastDate = "";
$lvals = ["h" =>[], "t"=>[]];
for($i = 1; $i < count($list["messages"]); $i++){
	$n = $list["messages"][$i];
	$cdate = substr($n["date"], 0, 10);
	if($cdate != $lastDate){
		if(strlen($lastDate)){
			echo $lastDate." :\n";
			echo "MIN temp  =  ".min($lvals["t"])."C\n";
			echo "MAX temp  =  ".max($lvals["t"])."C\n";
			echo "MEAN temp  =  ".mean($lvals["t"])."C\n";
			echo "MIN um  =  ".min($lvals["h"])."%\n";
			echo "MAX um  =  ".max($lvals["h"])."%\n";
			echo "MEAN um  =  ".mean($lvals["h"])."%\n";
			$lvals = ["h" =>[], "t"=>[]];
	         }

	}
		if($n["text"][0]=="t") $lvals["t"][] = (float) substr($n["text"], -6, -1);
		else $lvals["h"][] = (float) substr($n["text"], -6, -1);

	$lastDate = $cdate;
}
