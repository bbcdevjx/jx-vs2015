--description: 唐门普通弟子 竹海三关出口
--author: yuanlan	
--date: 2003/3/10


Include("tmnpc02_Default.lua")
Include("tmnpc02_UTask_8.lua")


function main()

UTask_tm = GetTask(2);

if (UTask_tm == 8) then			--入门任务
	tmnpc02_UTask_8()					
else	   	
	tmnpc02_Default()
end;	
	   	
end;	




