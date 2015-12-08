var col = 5;
var row = 10000;

function generate(i, j){
	return i + j;
}

inputArray = [3];
for(var i = 0; i < row; i++){
	var line = "";
	for(var j = 0; j < col; j++){
		line += generate(i, j);
		if(j < col - 1){
			line += ",";
		}
	}
	inputArray.push(line);
}

//Actual algorithm
function getHash(a, b){
	//Check lexigraphic order to keep hash consistent
	if(a.localeCompare(b) < 0){
		return a + "_" + b;
	}
	return b + "_" + a;
}
var dict = {};
var n = inputArray[0];
for(var i = 1; i < inputArray.length; i++){
	var line = inputArray[i];
	
	//Generate map
	var valArr = line.split(",");
	for(var j = 0; j < valArr.length; j++){
		var a = valArr[j];
		for(var k = j + 1; k < valArr.length; k++){
			var b = valArr[k];
			var h = getHash(a, b);
			if(h in dict){
				dict[h]++;
				if(dict[h] == n){
					//Output
					console.log(a + "," + b);
				}
			}else{
				dict[h] = 1;
			}
		}
	}
}
//Runtime: O(N*M*M)
//N = Rows, M = Max column
