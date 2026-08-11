--description: 武当派小道士清风入门任务
--author: yuanlan	
--date: 2003/5/14



function wdnpc01_UTask_0()

if (GetSeries() ~= 4) then							--如果玩家不属于土系
	Say("小道士清风：你是上山来游玩的吗？如果想拜师学艺，以你的根基，好像不太适合练本派的功夫。", 0)
else	if (GetFaction() ~= "") then						--如果玩家已经属于土系的另一门派
		Say("小道士清风：原来是昆仑派的大侠啊，久仰久仰！", 0)
	else									
		Say("小道士清风：我刚才打水的时候不小心将桶绳弄断了，结果<color=Red>木桶<color>掉进了<color=Red>井<color>里，打不了水，回去一定会被师兄责骂的。你愿意帮我取回<color=Red>木桶<color>吗？", 2, "愿意/yes", "我帮不了你/no")
	end
end;

end;


function yes()
Say("小道士清风：你真好！<color=Red>木桶<color>就掉在那个<color=Red>井<color>里。", 1, "我这就下井帮你找/ok");
DelItem("木桶")									--防止重接任务后，玩家捡起任务道具
end;


function no()
Say("小道士清风：那我找别人帮忙吧。", 0);
end;


function ok()
SetTask(5, 5);    			
NewWorld(82, 1593, 3193);
end;