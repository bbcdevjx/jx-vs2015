--description: 唐门普通弟子 竹海第二关 非任务对话
--author: yuanlan	
--date: 2003/3/10


function tmnpc03_Default()

UTask_tm = GetTask(2);

if (UTask_tm == 0) then	
Say("唐门庄丁：请在竹海三关入口处接受任务。", 0)
end;

if (UTask_tm > 0) and (UTask_tm < 6) then			--尚未过前一关
Say("唐门庄丁：拿到了青色竹杖再来找我。", 0)
end;				

if (UTask_tm >= 6) then						--已经过了两关
Say("唐门庄丁：要想顺利过关，你必须拿齐三柄竹杖，然后交给出口的人。", 0)
end;				

end;


