--description: 唐门普通弟子 竹海三关入口
--author: yuanlan	
--date: 2003/3/7


Include("tmnpc01_Default.lua")
Include("tmnpc01_UTask_enroll.lua")


function main()

UTask_tm = GetTask(2);

if (UTask_tm == 0) then				--入门任务
	tmnpc01_UTask_enroll()					
else	   	
	tmnpc01_Default()
end;	
	   	
end;	




