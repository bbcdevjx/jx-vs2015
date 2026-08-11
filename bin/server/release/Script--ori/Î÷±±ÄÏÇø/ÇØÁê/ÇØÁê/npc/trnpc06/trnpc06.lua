--description: 秦陵农夫
--author: yuanlan	
--date: 2003/5/19


Include("trnpc06_Default.lua")
Include("trnpc06_UTask_32.lua")

function main()

UTask_tr = GetTask(4);

if (UTask_tr == 32) then trnpc06_UTask_32()  return end;					--30级任务

trnpc06_Default()

end;	


