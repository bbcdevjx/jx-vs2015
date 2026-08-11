--description: 峨嵋派猛虎洞穴敌人任务战斗死亡
--author: yuanlan	
--date: 2003/3/4



function emenemy02_UTask_25()

Task0001 = GetTaskTemp(1)

if (Task0001 == 2) then	
	Say("白虎精虽然凶悍，但是被你收伏了三次以后，终于乖乖地降服了。虎患已除，你可以回去复命了。", 1, "知道了/ok")
else
	Task0001 = Task0001 + 1	
	SetTaskTemp(1, Task0001)
end;

end;

function ok()
Msg2Player("恭喜你成功收伏猛虎！")
SetTask(1, 28)
end;