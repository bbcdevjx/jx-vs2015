--description: 天王帮前殿 王佐
--author: yuanlan	
--date: 2003/4/24


Include("twnpc02_Default.lua")
Include("twnpc02_UTask_10.lua")
Include("twnpc02_UTask_15.lua")

function main()

UTask_tw = GetTask(3);

if (UTask_tw == 10) then twnpc02_UTask_10()  return end;					--10级任务
if (UTask_tw == 15) then twnpc02_UTask_15()  return end;					--10级任务

twnpc02_Default()

end;	


