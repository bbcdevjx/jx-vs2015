--description: 武陵山 伏流洞敌人 天王帮40级任务战斗死亡
--author: yuanlan	
--date: 2003/4/26



function twenemy04_UTask_45()

if ( HaveItem("火蜥蜴鳞片") == 0) then				--还没有得到火蜥蜴鳞片
	i = random(0,1)						--概率为50%
	if (i == 0) then 
		AddEventItem("火蜥蜴鳞片")
		Msg2Player("得到火蜥蜴的鳞片。")
		if ( HaveItem("绿毛龟") == 1) then 		--得到火蜥蜴鳞片后，判断有没有绿毛龟，是否两种药引都得到
			Say("两种药引都已找到，赶紧去天王大殿交给路云远老护法吧！", 0)
			SetTask(3, 48)	
		end
	end
end;

end;