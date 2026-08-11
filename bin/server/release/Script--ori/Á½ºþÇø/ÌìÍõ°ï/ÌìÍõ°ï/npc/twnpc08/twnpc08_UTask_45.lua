--description: 天王帮老渔翁40级任务
--author: yuanlan	
--date: 2003/4/28



function twnpc08_UTask_45()

UTask_twsub02 = GetTask(14);

if (UTask_twsub02 == 6) then 
	if ( HaveItem("五条蚯蚓") == 0) then				--蚯蚓丢失处理
		Say("系统：真糟糕！你不小心把水生送的蚯蚓给弄丢了，如果要继续任务，你必须得有蚯蚓。", 2, "我再找找/find", "重新去找荷嫂/redo")	
	else
		Talk(3, "", "老渔翁：哎哟，我今天带来的鱼饵好像不够，怎么办？", "玩家：老大爷，我这里有几条蚯蚓，送给你做鱼饵吧。", "老渔翁：好孩子，谢谢你，我刚才不小心钓起了一只绿毛龟，就送给你吧。")
		DelItem("五条蚯蚓")
		AddEventItem("绿毛龟")
		Msg2Player("得到绿毛龟。")
		SetTask(14, 10)	
		if ( HaveItem("火蜥蜴鳞片") == 1) then 		--得到绿毛龟后，判断有没有火蜥蜴鳞片，是否两种药引都得到
			Say("两种药引都已找到，赶紧去天王大殿交给路云远老护法吧！", 0)
			SetTask(3, 48)	
		end			
	end
return	
end;	


Say("老渔翁：老汉我天天都在这里钓鱼，这儿的鱼都认识我啦。", 0)
	
	
end;	


function find()
end;

function redo()
DelItem("莲子")
DelItem("三个鸡蛋")
SetTask(14, 0)
end;