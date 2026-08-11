--description: 天王帮右使杨湖非任务对话
--author: yuanlan	
--date: 2003/4/25


function twnpc03_Default()

UTask_tw = GetTask(3);

if (UTask_tw < 20) then								--尚未接20级任务
Say("杨湖：咱们天王帮名气在外，经常有些宵小之辈冒充本帮弟子，在外面为非作歹。", 0)
end;				

if (UTask_tw > 20) and (UTask_tw < 28) then					--已经接到20级任务，尚未完成
Say("杨湖：那帮<color=Red>土匪<color>经常在<color=Red>武陵山东部<color>的<color=Red>白水洞<color>附近出没。", 0)
end;				

if (UTask_tw > 28) and (UTask_tw < 70) then					--已经完成20级任务，尚未出师
Say("杨湖：我们天王帮与老百姓唇齿相依，你要记住，绝不可自恃武功、做出欺压百姓的行径，明白吗？", 0)
end;				

if (UTask_tw >= 70) then							--已经出师
Say("杨湖：人心即江湖，只要心胸坦荡，无论身处何地都是青天白日，倘若心地龌龊，走到哪里都是人间炼狱。", 0)
end;				

end;



