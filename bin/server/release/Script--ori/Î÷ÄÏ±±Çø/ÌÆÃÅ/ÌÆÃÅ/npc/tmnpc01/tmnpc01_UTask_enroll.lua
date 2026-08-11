--description: 唐门普通弟子 竹海三关入口 入门任务
--author: yuanlan	
--date: 2003/3/7



function tmnpc01_UTask_enroll()

Say("唐门庄丁：要想加入本门，必须闯过<color=Red>竹海三关<color>，你要闯关吗？", 2, "闯/yes", "不闯/no");
DelItem("青色竹杖")			--防止重接任务后，玩家捡起任务道具
DelItem("白色竹杖")			--防止重接任务后，玩家捡起任务道具
DelItem("紫色竹杖")			--防止重接任务后，玩家捡起任务道具

end;


function yes()

if (GetSeries() ~= 1) then								--如果玩家不属于木系
	Say("唐门庄丁：本门需要的是一些头脑灵活、做事不循规蹈矩、敢于突破常规的人，你不适合本门，还是另投别的门派吧！", 0)
else
	if (GetFaction() ~= "") then							--如果玩家已经属于木系的某一门派
		Say("唐门庄丁：你是五毒教的人吗？本门与贵教素无来往，不知有何贵干？虽然听说贵教使毒下蛊的手段天下一流，但是本门却不怕，倘若贵教有什么企图，恐怕在本门的暗器底下也讨不了好去！", 0)
	else	
		Talk(2, "", "唐门庄丁：在<color=Red>竹海三关<color>里你要想办法得到<color=Red>青白紫三柄竹杖<color>，然后交给出口的人，才能算是过关。", "第一柄<color=Red>青色竹杖<color>你要打败第一关里的<color=Red>大马猴<color>才能得到，想得到<color=Red>白色竹杖<color>你必须去第二关找一个<color=Red>庄丁<color>，最后一柄<color=Red>紫色竹杖<color>在第三关的<color=Red>庄丁<color>手上。")
		--SetPos(3636, 5732)							--把玩家传送入迷宫
		SetTask(2, 2)
	end				
end;	

end;


function no()
Say("唐门庄丁：本门不欢迎陌生人随意进出。", 0)
end;





