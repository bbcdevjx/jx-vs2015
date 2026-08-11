
function main(sel)
	if (GetLevel() >= 70) then
		NewWorld(319,1630,3592)		-- 设置走出Trap点，目的点在城内	
		SetFightState(1)		-- 转换为非战斗状态
		AddTermini(196)
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;
