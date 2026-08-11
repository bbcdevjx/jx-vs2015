--description: 天王帮寝宫 杨瑛
--author: yuanlan	
--date: 2003/4/28


Include("twnpc10_Default.lua")
Include("twnpc10_UTask_60.lua")
Include("twnpc10_UTask_66.lua")

function main()

UTask_tw = GetTask(3);

if (UTask_tw == 60) then twnpc10_UTask_60()  return end;					--出师任务
if (UTask_tw == 66) then twnpc10_UTask_66()  return end;					--出师任务

twnpc10_Default()

end;	


