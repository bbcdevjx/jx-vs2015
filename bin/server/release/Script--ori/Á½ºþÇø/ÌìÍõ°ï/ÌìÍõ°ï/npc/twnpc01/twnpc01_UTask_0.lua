--description: 天王帮众入门任务
--author: yuanlan	
--date: 2003/4/24



function twnpc01_UTask_0()

Say("孙道领：本帮的兄弟都是一些豪气冲天的汉子，大伙儿经常在一起赌酒论英雄，你要不要加入本帮啊？", 2, "加入/yes", "不加入/no");
DelItem("蓬莱春")					--防止重接任务后，玩家捡起任务道具

end;

function yes()
if ( GetSex() == 1 ) then     								--如果玩家性别为女
	Say("孙道领：我喝酒之后有点头晕，居然没看出你是个黄花大闺女！本帮兄弟都是些粗豪大汉，像你这样娇滴滴的姑娘可不行！", 0)
else
	if (GetSeries() ~= 0) then							--如果玩家不属于金系
		Say("孙道领：以你的资质和根骨不适合修练本门武功，我们不想误人子弟，你还是另投明师吧！", 0)
	else	if (GetFaction() ~= "") then						--如果玩家已经属于金系的某一门派
			Say("孙道领：你不是少林派的小师父吗？怎么又来投身本帮，是好汉就不能脚踏两只船！", 0)
		else									-- 玩家性别为男
    			Say("孙道领：你要想加入本帮，就先去弄一坛好酒来！听说<color=Red>巴陵县的酒馆<color>里有一种美酒叫<color=Red>“蓬莱春”<color>，乃是酒中仙品……",0)  
    			SetTask(3, 2)    			
		end
	end
end;			
end;

function no()
end;