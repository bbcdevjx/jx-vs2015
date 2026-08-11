--description: 唐门竹海第三关敌人 任务战斗死亡
--author: yuanlan	
--date: 2003/3/10



function tmenemy03_UTask_6()

i = random(0,7)							
if (i == 0) then
	Say("正东为雷", 0)
	Msg2Player("得到口诀“正东为雷”。")
return
end
if (i == 1) then 
	Say("正南为火", 0)
	Msg2Player("得到口诀“正南为火”。")
return
end
if (i == 2) then 
	Say("正西为沼", 0) 
	Msg2Player("得到口诀“正西为沼”。")
return	
end
if (i == 3) then 
	Say("正北为水", 0) 
	Msg2Player("得到口诀“正北为水”。")
return	
end
if (i == 4) then 
	Say("东南为风", 0) 
	Msg2Player("得到口诀“东南为风”。")
return		
end
if (i == 5) then 
	Say("东北为山", 0) 
	Msg2Player("得到口诀“东北为山”。")
return	
end
if (i == 6) then 
	Say("西南为地", 0) 
	Msg2Player("得到口诀“西南为地”。")
return	
end
if (i == 7) then 
	Say("西北为天", 0) 
	Msg2Player("得到口诀“西北为天”。")
return		
end


end;