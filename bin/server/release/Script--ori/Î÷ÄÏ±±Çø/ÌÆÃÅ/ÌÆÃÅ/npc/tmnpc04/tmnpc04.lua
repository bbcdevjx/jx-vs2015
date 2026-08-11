--description: 唐门普通弟子 竹海第三关
--author: yuanlan	
--date: 2003/3/10


Include("tmnpc04_Default.lua")
Include("tmnpc04_UTask_6.lua")


function main()

UTask_tm = GetTask(2);

if (UTask_tm == 6) then					--入门任务
	tmnpc04_UTask_6() 	
else	   	
	tmnpc04_Default()
end;	
	   	
end;	




