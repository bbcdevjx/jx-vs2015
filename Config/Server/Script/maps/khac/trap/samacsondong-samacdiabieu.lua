
function main(sel)
	SetFightState(1)
	local a = random(1,10)
	if a == 1 then
 	NewWorld(225,1474,3271)    
	AddTermini(226)
	elseif a == 2 then        
	NewWorld(225,1579,3185)
	AddTermini(226)
	elseif a == 3 then        
	NewWorld(226,1555,3176)
	AddTermini(227)
	elseif a == 4 then
 	NewWorld(226,1554,3175)    
	AddTermini(227)
	elseif a == 5 then
 	NewWorld(226,1691,3247)    
	AddTermini(227)
	elseif a == 6 then        
	NewWorld(227,1583,3242)
	AddTermini(228)
	elseif a == 7 then        
	NewWorld(227,1525,3274)
	SetFightState(1)
	AddTermini(228)
	elseif a == 8 then
 	NewWorld(224,1530,2925)    
	AddTermini(225)
	elseif a == 9 then        
	NewWorld(224,1638,2945)
	AddTermini(225)
	else
	NewWorld(224,1713,2802)
	AddTermini(225)
	end	
end;
