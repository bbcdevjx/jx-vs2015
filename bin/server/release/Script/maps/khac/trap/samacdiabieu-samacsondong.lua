
function main(sel)
	SetFightState(1)
	local a = random(1,6)
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
	elseif a == 5 then        
	NewWorld(227,1583,3242)
	AddTermini(228)
	else        
	NewWorld(227,1525,3274)
	AddTermini(228)
	end
end;
