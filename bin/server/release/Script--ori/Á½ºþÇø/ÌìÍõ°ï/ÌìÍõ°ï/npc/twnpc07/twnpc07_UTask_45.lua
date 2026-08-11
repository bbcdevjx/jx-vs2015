--description: 天王帮水生40级任务
--author: yuanlan	
--date: 2003/4/28



function twnpc07_UTask_45()

UTask_twsub02 = GetTask(14);

if (UTask_twsub02 == 4) then 
	if ( HaveItem("三个鸡蛋") == 0) then				--鸡蛋丢失处理
		Say("系统：真糟糕！你不小心把渔妇荷嫂送的鸡蛋给弄丢了，如果要继续任务，你必须得有鸡蛋。", 2, "我再找找/find", "重新去找荷嫂/redo")	
	else
		Talk(3, "", "水生：我最爱吃卤鸡蛋了，可是我家太穷，买不起鸡蛋。", "玩家：小朋友，我这里有三个鸡蛋，送给你吧！", "水生：我虽然穷，但是娘说过不能白拿别人的东西，这样吧，我把这五条蚯蚓送给你玩。")
		DelItem("三个鸡蛋")
		AddEventItem("五条蚯蚓")
		Msg2Player("得到五条蚯蚓。")
		SetTask(14, 6)	
	end
return	
end;	
	
Say("水生：我想快点长大，长大就可以学功夫罗！", 0)
	
end;


function find()
end;

function redo()
DelItem("莲子")
SetTask(14, 0)
end;	