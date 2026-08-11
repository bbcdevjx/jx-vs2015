--description: 武当派出师任务 武当山宝箱3
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
	if (UTask_wdsub04 == 0) then 
		Say("宝箱：<color=Red>襄阳衙门<color>里的<color=Red>守将<color>整日只知道花天酒地，欺压百姓，老百姓怨声载道，此等<color=Red>暴政<color>，岂可不除？", 0)
		Msg2Player("襄阳衙门里的守将整日只知道花天酒地，欺压百姓，老百姓怨声载道，此等暴政，岂可不除？")
		SetTask(19, 2)	
	return	
	end
	if (UTask_wdsub04 > 0) and (UTask_wdsub04 < 5)then 
		Say("宝箱：襄阳城的百姓还生活在<color=Red>襄阳衙门守将<color>的<color=Red>暴政<color>之下……", 0)
		Msg2Player("襄阳城的百姓还处在水深火热之中……")
	return	
	end
	if (UTask_wdsub04 == 5) then 
		AddEventItem("太清真经")
		Say("清除了襄阳城的<color=Red>暴政<color>，打开宝箱，发现一本<color=Red>《太清真经》<color>。", 0)
		Msg2Player("清除了襄阳城的暴政，得到《太清真经》一部。")
		SetTask(19, 10)
		if (UTask_wdsub02 == 10) and (UTask_wdsub03 == 10) then 		
			SetTask(5, 65)	
		end
	return	
	end
	if (UTask_wdsub04 == 10) then 
		Say("宝箱已空。", 0)		
	end		
end

if (UTask_wd > 62) then	
Say("宝箱已空。", 0)
end;

end;

  	





