--description: 峨嵋派 长江源头清和 任务战斗死亡
--author: yuanlan	
--date: 2003/3/6



function emenemy06_UTask_65()

if ( HaveItem("烟玉指环") == 0) then					--没有烟玉指环
	i = random(0,4)							--得到烟玉指环的概率是20%
	if (i == 0) then  
		AddEventItem("烟玉指环") 
		Msg2Player("打败清和，夺回烟玉指环")
		SetTask(1, 68)

	end
end;

end;