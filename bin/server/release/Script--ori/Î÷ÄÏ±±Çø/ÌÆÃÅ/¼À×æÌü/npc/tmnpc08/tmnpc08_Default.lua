--description: 唐门唐不染 非任务对话
--author: yuanlan	
--date: 2003/3/11


function tmnpc08_Default()

UTask_tm = GetTask(2);

if (UTask_tm < 30) then								--尚未接30级任务
Say("唐不染：这祭祖厅是本门拜祭列祖列宗的地方，寻常人等不得擅入！", 0)
end;				

if (UTask_tm > 30) and (UTask_tm < 40) then					--已经接到30级任务，尚未完成
Say("唐不染：我已暗中探察过，那伙绑匪好像经常出没在<color=Red>青城山东边白云洞<color>一带。", 0)
end;				

if (UTask_tm >= 40) and (UTask_tm < 70) then					--已经完成30级任务，尚未出师
Say("唐不染：你能帮唐云师叔洗脱冤屈，看来我要对你刮目相看了！", 0)
end;				

if (UTask_tm >= 70) then							--已经出师
Say("唐不染：我一直想出去走走，但是爹老是不同意。", 0)
end;				

end;


