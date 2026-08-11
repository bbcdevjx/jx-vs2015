--description: 天王帮众非任务对话
--author: yuanlan	
--date: 2003/4/24


function twnpc01_Default()

UTask_tw = GetTask(3);

if (UTask_tw < 10) then 					--尚未入门
	Say("孙道领：先弄来一坛好酒再说！听说<color=Red>巴陵县的酒馆<color>里有一种美酒叫<color=Red>“蓬莱春”<color>，乃是酒中仙品……",0) 
else
	if (UTask_tw < 70) then   				--已经入门，尚未出师
		Say("孙道领：好兄弟！有空咱哥俩好好喝上几杯！", 0)
	else							--已经出师
		Say("孙道领：没事儿别忘了回来陪哥哥喝酒！", 0)
	end
end;	

end;



