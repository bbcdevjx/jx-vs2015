--description: 唐门竹海第二关敌人 任务战斗死亡
--author: yuanlan	
--date: 2003/3/10



function tmenemy02_UTask_2()

i = random(0,4)							
if (i == 0) then 
	Say("二四为肩", 0) 
	Msg2Player("得到口诀“二四为肩”。")
return	
end
if (i == 1) then 
	Say("六八为足", 0) 
	Msg2Player("得到口诀“六八为足”。")
return	
end
if (i == 2) then 
	Say("左三右七", 0) 
	Msg2Player("得到口诀“左三右七”。")
return	
end
if (i == 3) then 
	Say("戴九履一", 0) 
	Msg2Player("得到口诀“戴九履一”。")
return	
end
if (i == 4) then 
	Say("五居中央", 0)
	Msg2Player("得到口诀“五居中央”。")
return	
end

end;