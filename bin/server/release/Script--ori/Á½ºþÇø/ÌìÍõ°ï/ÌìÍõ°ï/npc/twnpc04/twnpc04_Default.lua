--description: 天王帮左使古柏非任务对话
--author: yuanlan	
--date: 2003/4/25


function twnpc04_Default()

UTask_tw = GetTask(3);

if (UTask_tw < 30) then								--尚未接30级任务
Say("古柏：别看帮主是个女流之辈，可是治理本帮恩威并施、赏罚分明，大家心中都挺敬畏她的。", 0)
end;				

if (UTask_tw > 30) and (UTask_tw < 35) then					--已经接到30级任务，尚未完成
Say("古柏：<color=Red>天王令<color>是在<color=Red>苗岭燕子洞<color>丢失的，如果你能帮我找回来，我保举你做掌舵头领。", 0)
end;				

if (UTask_tw > 35) and (UTask_tw < 70) then					--已经完成30级任务，尚未出师
Say("古柏：好兄弟，你可帮了我一个大忙啊！", 0)
end;				

if (UTask_tw >= 70) then							--已经出师
Say("古柏：出岛后别忘了常回来看看兄弟们！", 0)
end;				

end;



