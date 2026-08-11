--description: 武当派出师任务 武当山宝箱1
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
	if (UTask_wdsub02 == 0) then 
		Say("宝箱：最近前线宋军营中<color=Red>瘟疫<color>蔓延，需要到<color=Red>襄阳城<color>中找<color=Red>药店老板<color>帮忙解决。", 0)
		Msg2Player("最近前线宋军营中瘟疫蔓延，需要到襄阳城中找药店老板帮忙解决。")
		SetTask(17, 2)	
	return	
	end
	if (UTask_wdsub02 > 0) and (UTask_wdsub02 < 8)then 
		Say("宝箱：<color=Red>瘟疫<color>还在蔓延中……", 0)
		Msg2Player("瘟疫还在蔓延中……")
	return	
	end
	if (UTask_wdsub02 == 8) then 
		AddEventItem("玉清真经")
		Say("<color=Red>瘟疫<color>已除，打开宝箱，发现一本<color=Red>《玉清真经》<color>。", 0)
		Msg2Player("瘟疫已除，得到《玉清真经》一部。")
		SetTask(17, 10)
		if (UTask_wdsub03 == 10) and (UTask_wdsub04 == 10) then 		
			SetTask(5, 65)	
		end
	return	
	end
	if (UTask_wdsub02 == 10) then 
		Say("宝箱已空。", 0)		
	end
end

if (UTask_wd > 62) then	
Say("宝箱已空。", 0)
end;

end;

  	





