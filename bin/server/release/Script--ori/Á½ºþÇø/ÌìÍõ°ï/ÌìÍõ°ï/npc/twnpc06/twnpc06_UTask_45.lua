--description: 天王帮渔妇荷嫂40级任务
--author: yuanlan	
--date: 2003/4/28



function twnpc06_UTask_45()

UTask_twsub02 = GetTask(14);

if (UTask_twsub02 == 0) then 
	DelItem("莲子")
	DelItem("三个鸡蛋")
	DelItem("五条蚯蚓")
	Say("渔妇荷嫂：我男人出湖捕鱼，这几天就要回家了，他最爱喝银耳莲子汤，不巧家里的莲子都用完了，我现在正忙着洗衣，你能帮我去巴陵县杂货店买些莲子回来吗？", 0)
	SetTask(14, 2)	
return	
end;	
	
if (UTask_twsub02 == 2) then 
	Say("渔妇荷嫂：你能帮我去巴陵县杂货店买些莲子回来吗？", 0)
return	
end;	
	
if (UTask_twsub02 == 3) then 
	if ( HaveItem("莲子") == 0) then				--莲子丢失的处理
		Say("系统：真糟糕！你不小心把买来的莲子给弄丢了，如果要继续任务，你必须得有莲子。", 2, "我再找找/find", "重新去巴陵县杂货铺买/redo")
	else
		Say("渔妇荷嫂：谢谢你帮我买莲子，这三个鸡蛋送给你吧。", 0)
		DelItem("莲子")
		AddEventItem("三个鸡蛋")
		Msg2Player("得到三个鸡蛋。")
		SetTask(14, 4)	
	end
return	
end;	
	
Say("渔妇荷嫂：我男人怎么还没有回来呢？", 0)
	
end;	


function find()
end;

function redo()
SetTask(14, 2)
end;