--description: 唐门唐一尘 非任务对话
--author: yuanlan	
--date: 2003/3/11


function tmnpc06_Default()

UTask_tm = GetTask(2);

if (UTask_tm == 54) then							--50级任务
Say("唐一尘：五师弟刚才匆匆忙忙去江津村探望他生病的舅舅，三师弟也出去了，但不知去了哪里。", 0)
return
end;				

if (UTask_tm < 20) then								--尚未接20级任务
Say("唐一尘：你是新加入的弟子吗？", 0)
end;				

if (UTask_tm > 20) and (UTask_tm < 30) then					--已经接到20级任务，尚未完成
Say("唐一尘：姑丈死后，姑母一直住在后山<color=Red>无心谷<color>的一间茅屋里，她从不见唐门中人，我去了好几次，都只能在<color=Red>门口<color>向她请安，这次就拜托你了！", 0)
end;				

if (UTask_tm >= 30) and (UTask_tm < 70) then					--已经完成20级任务，尚未出师
Say("唐一尘：多谢你化解了我爹和姑母的恩怨！", 0)
end;				

if (UTask_tm >= 70) then							--已经出师
Say("唐一尘：别忘了有空回来看看我们。", 0)
end;				

end;


