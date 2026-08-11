--description: 武当派出师任务 武当山宝箱2
--author: yuanlan	
--date: 2003/5/17


function main()

UTask_wd = GetTask(5);
UTask_wdsub02 = GetTask(17);
UTask_wdsub03 = GetTask(18);
UTask_wdsub04 = GetTask(19);

if (UTask_wd < 62) then	
Say("未接任务，你无法打开此宝箱。", 0)
end;
	
if (UTask_wd == 62) then
	if (UTask_wdsub03 == 0) then 
		Say("宝箱：最近抗金官兵的<color=Red>兵械<color>不足，<color=Red>伤亡<color>惨重，需要到<color=Red>襄阳城<color>中找<color=Red>铁匠<color>帮忙解决。", 0)
		Msg2Player("最近抗金官兵的兵械不足，需要到襄阳城中找铁匠帮忙解决。")
		SetTask(18, 2)	
	return	
	end
	if (UTask_wdsub03 > 0) and (UTask_wdsub03 < 8)then 
		Say("宝箱：由于<color=Red>兵械<color>不足，抗金官兵的<color=Red>伤亡<color>人数在不断增加……", 0)
		Msg2Player("由于兵械不足，抗金官兵的伤亡人数在不断增加……")
	return	
	end
	if (UTask_wdsub03 == 8) then 
		AddEventItem("上清真经")
		Say("所需兵械得到及时补给，前线官兵的战斗力大大增强。打开宝箱，发现一本<color=Red>《上清真经》<color>。", 0)
		Msg2Player("所需兵械得到及时补给，前线官兵的战斗力大大增强。得到《上清真经》一部。")
		SetTask(18, 10)
		if (UTask_wdsub02 == 10) and (UTask_wdsub04 == 10) then 		
			SetTask(5, 65)	
		end
	return	
	end
	if (UTask_wdsub03 == 10) then 
		Say("宝箱已空。", 0)		
	end	
end

if (UTask_wd > 62) then	
Say("宝箱已空。", 0)
end;

end;

  	





