--description: 唐门普通弟子 竹海第三关 入门任务
--author: yuanlan	
--date: 2003/3/10



function tmnpc04_UTask_6()

if ( HaveItem("青色竹杖") == 1 and HaveItem("白色竹杖") == 1) then
	Say("唐门庄丁：答对我的三卦，就可以得到<color=Red>紫色竹杖<color>。第一卦是“正南与正东”：", 3, "烈火轰雷/True1", "水火不容/False1", "煽风点火/False1")
return
end;
	
if  HaveItem("青色竹杖") == 0  then
	Say("系统：真糟糕！你不小心把青色竹杖给弄丢了，如果要通过竹海三关，你必须得到青色竹杖，否则只能重新过关。", 2, "我再找找/find", "重新闯竹海三关/redo1")
return		
end;

if ( HaveItem("青色竹杖") == 1 and HaveItem("白色竹杖") == 0) then
	Say("系统：真糟糕！你不小心把白色竹杖给弄丢了，如果要通过竹海三关，你必须得到白色竹杖，否则只能重新过关。", 2, "我再找找/find", "重新闯竹海三关/redo2")
return		
end;

end;

	
function False1()
Say("唐门庄丁：第一卦就答错了，也许那些猴子们会告诉你。", 0);
end;


function True1()
Say("唐门庄丁：对了，听好，第二卦是“东南与正北”：", 3, "山高水长/False2", "风生水起/True2", "雷厉风行/False2");
end;


function False2()
Say("唐门庄丁：不对不对，为什么不去问问那些猴子呢？", 0);
end;


function True2()
Say("唐门庄丁：不错，最后一卦是“西北与西南”：", 3, "风行水上/False3", "天崩地裂/True3", "山清水秀/False3");
end;	


function False3()
Say("唐门庄丁：错了，别以为人一定比猴子聪明，说不定它们比你知道得还多呢！", 0);
end;


function True3()
Say("唐门庄丁：三卦你全都答对了，这是你要的紫色竹杖。如果你三柄竹杖都已拿齐，就可以去交给出口的人，顺利过关了。", 0);
AddEventItem("紫色竹杖");
Msg2Player("得到紫色竹杖。");
SetTask(2, 8);
end;	

	
function find()
end;

function redo1()
Say("系统：请重新在竹海三关入口处接受任务。", 0)
Msg2Player("任务失败，请重新在竹海三关入口处接受任务。")
DelItem("白色竹杖")
SetTask(2, 0)
end;

function redo2()
Say("系统：请重新在竹海三关入口处接受任务。", 0)
Msg2Player("任务失败，请重新在竹海三关入口处接受任务。")
DelItem("青色竹杖")
SetTask(2, 0)
end;