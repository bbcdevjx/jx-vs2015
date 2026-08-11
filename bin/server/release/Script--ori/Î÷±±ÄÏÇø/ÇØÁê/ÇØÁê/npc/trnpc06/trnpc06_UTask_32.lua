--description: 秦陵农夫 天忍教30级任务
--author: yuanlan	
--date: 2003/5/19



function trnpc06_UTask_32()

if ( HaveItem("云梦紫") == 0) then
	Talk(3, "select", "农夫：我昨天在田里挖地的时候，挖到了一块紫色的石头，闪闪发光的怪好看，可是既不能吃又不能穿，有什么用？上个月同村的王七挖到了一袋银子，人家运气怎么这么好？人家挖到的是银子，我却只挖到一块石头，真倒霉！", "玩家：（这不是云梦紫吗？！）大叔，我想买你这块石头，可以吗？", "农夫：我没听错吧？你真的要买？（我真走运，遇到了一个大傻冒），好好好，只要你拿一百两银子来，这块石头就是你的了！")
else
	Say("农夫：你还要石头吗？下次我再挖到的话，便宜点卖给你啰！", 0)
	if (HaveItem("鸽血红") == 1 and  HaveItem("冰晶蓝") == 1 and HaveItem("祖母绿") == 1) then 		
		SetTask(4, 35)
	end
end;

end;


function select()
if (GetCash() >= 100) then
	Pay(100);
	AddEventItem("云梦紫")
	Msg2Player("得到宝石云梦紫。")
	if (HaveItem("鸽血红") == 1 and  HaveItem("冰晶蓝") == 1 and HaveItem("祖母绿") == 1) then 		
		SetTask(4, 35)
	end
else
	Say("农夫：等凑够了钱再来找我吧！", 0)	
end;
end;	



