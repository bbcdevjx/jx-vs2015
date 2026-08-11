--description: 武当派叶继美非任务对话
--author: yuanlan	
--date: 2003/5/14


function wdnpc03_Default()

UTask_wd = GetTask(5);

if (UTask_wd < 12) then								--尚未接10级任务
Say("叶继美：不识《道德经》，怎做武当弟子？", 0)
end;				

if (UTask_wd >= 20) and (UTask_wd < 70) then					--已经完成10级任务，尚未出师
Say("叶继美：今日有读《道德经》吗？", 0)
end;				

if (UTask_wd >= 70) then							--已经出师
Say("叶继美：我像你这么年轻的时候，也是雄心万丈，如今方知天外有天，人外有人。你虽是本派的出师弟子，但也不要小瞧了旁人，满遭损，谦受益，自古皆然。", 0)
end;					

end;



