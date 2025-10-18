
function moneyAddSub(val){
	
	with (Main) {
		
		if (val < 0) {
			moneyCol = c_red;	
		} else moneyCol = c_green;
		moneyX = 0;
		moneySpeed = 1.5;
		moneyAlpha = 1.0;
		if (val < 0 && currentVal < 0 || val > 0 && currentVal > 0)
			currentVal += val;
		else currentVal = val;
		global.money += val;
	}

}