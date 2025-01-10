/*  Colors class
 Created by: Kirk Brooks as Designer, Created: 01/10/25, 09:51:14
 ------------------
Functions for handling color values as integers and hex
It also supports RGB as an array: [r; g; b]

Run ._text()  to see examples
*/

Class constructor
	
Function rgbToInteger($r : Variant; $g : Integer; $b : Integer) : Integer
	If (Value type($r)=Is collection)
		return ($r[0] << 16) | ($r[1] << 8) | $r[2]
	Else 
		return ($r << 16) | ($g << 8) | $b
	End if 
	
Function integerToRgb($int) : Collection
	// returns collection of RGB values
	return This._rgbToArray($int)
	
Function rgbToHex($r : Variant; $g : Integer; $b : Integer) : Text
	// values or array, -> #RRGGBB
	Case of 
		: (Value type($r)=Is collection)
			return "#"+Substring(String($r[0]; "&x"); 5)+Substring(String($r[1]; "&x"); 5)+Substring(String($r[2]; "&x"); 5)
		: ($r>255)
			return This.integerToColor($r)
		Else 
			return "#"+Substring(String($r; "&x"); 5)+Substring(String($g; "&x"); 5)+Substring(String($b; "&x"); 5)
	End case 
	
Function hexToInteger($hex : Text) : Integer
	Case of 
		: ($hex="")
			return 0
		: ($hex="#@")
			$hex:=Substring($hex; 2)
		: ($hex="0x00@")
			$hex:=Substring($hex; 5)
		: ($hex="0x@")
			$hex:=Substring($hex; 3)
	End case 
	
	return Formula from string("0x00"+$hex).call()
	
Function integerToHex($int : Integer) : Text
	return String($int; "&x")
	
Function integerToColor($int : Integer) : Text
	// returns in format: '#123456'
	return "#"+Substring(String($int; "&x"); 5)
	
	//mark:  --- private
Function _rgbToArray($r : Integer; $g : Integer; $b : Integer) : Collection
	var $i : Integer
	
	Case of 
		: (Count parameters=1)
			$i:=$r
			$r:=($i & 0x00FF0000) >> 16
			$g:=($i & 0xFF00) >> 8
			$b:=($i & 0x00FF)
			return [$r; $g; $b]
			
		: (Count parameters=3)
			return [$r; $g; $b]
			
		Else 
			return [0; 0; 0]
	End case 
	
Function _test->$testResult : Text
	var $i; $r; $g; $b : Integer
	var $col : Collection
	var $expected; $hex : Text
	
	$r:=205  // Red value
	$g:=192  // Green value
	$b:=80  // Blue value
	
	$testResult:="Test Class: Color\n"
	$testResult+="  test values:\n  r = "+String($r)+"\n  g = "+String($g)+"\n  b = "+String($b)+"\n"
	
	$i:=This.rgbToInteger($r; $g; $b)
	$testResult+="\n.rgbToInteger($r;$g;$b) = 13484112:  "+String($i=13484112)+"\n"
	
	$expected:=JSON Stringify([$r; $g; $b])
	$col:=This.integerToRgb($i)
	$testResult+="\n.integerToRgb(13484112) = "+$expected+" : "+String($expected=JSON Stringify($col))+"\n"
	
	$i:=This.rgbToInteger($col)
	$testResult+="\n.rgbToInteger("+$expected+") = 13484112:  "+String($i=13484112)+"\n"
	
	$hex:=This.rgbToHex($col)
	$testResult+="\n.rgbToHex("+$expected+") = #CDC050:  "+String($hex="#CDC050")+"\n"
	
	$hex:=This.rgbToHex($i)
	$testResult+=".rgbToHex("+String($i)+") = #CDC050:  "+String($hex="#CDC050")+"\n"
	
	$hex:=This.rgbToHex($r; $g; $b)
	$testResult+=".rgbToHex($r;$g;$b) = #CDC050:  "+String($hex="#CDC050")+"\n"
	
	$hex:=This.integerToColor($i)
	$testResult+="\n.integerToColor(13484112) = #CDC050:  "+String($hex="#CDC050")+"\n"
	
	$hex:=This.integerToHex($i)
	$testResult+="\n.integerToHex("+String($i)+") = 0x00CDC050:  "+String($hex="0x00CDC050")+"\n"
	
	$i:=This.hexToInteger("")
	$testResult+="\n.hexToInteger(\"\") = 0:  "+String($i=0)+"\n"
	
	$i:=This.hexToInteger("0x00CDC050")
	$testResult+=".hexToInteger(\"0x00CDC050\") = 13484112:  "+String($i=13484112)+"\n"
	
	$i:=This.hexToInteger("#CDC050")
	$testResult+=".hexToInteger(\"#CDC050\") = 13484112:  "+String($i=13484112)+"\n"
	
	$i:=This.hexToInteger("0xCDC050")
	$testResult+=".hexToInteger(\"0xCDC050\") = 13484112:  "+String($i=13484112)+"\n"
	