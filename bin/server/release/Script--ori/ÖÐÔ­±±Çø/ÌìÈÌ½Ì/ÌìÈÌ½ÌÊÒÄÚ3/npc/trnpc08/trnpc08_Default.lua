--description: 天忍教左护法端木睿非任务对话
--author: yuanlan	
--date: 2003/5/19


function trnpc08_Default()

UTask_tr = GetTask(4);

if (UTask_tr < 50) then								--尚未接50级任务
Say("左护法端木睿：武功本无正邪，只有强弱。江湖之事，能者为之，天下之势，强者掌之。", 0)
end;				

if (UTask_tr > 50) and (UTask_tr < 55) then					--已经接到50级任务，尚未完成
Say("左护法端木睿：关押<color=Red>凤翕如<color>的<color=Red>汴京铁塔<color>一共有<color=Red>三道机关<color>，打开全部机关即可救出凤翕如，记住，不论死活，都绝不能让凤翕如落在宋人手里！", 0)
end;				

if (UTask_tr >= 60) and (UTask_tr < 70) then					--已经完成50级任务，尚未出师
Say("左护法端木睿：教中新人辈出，优胜劣汰的情况比比皆是，警惕之心不可失啊。", 0)
end;				

if (UTask_tr >= 70) then							--已经出师
Say("左护法端木睿：成就大事者，需不拘小节，倘若做什么事都瞻前顾后、畏首畏尾，那就什么也做不成了！", 0)
end;				


end;



