--description: 天王帮老渔翁非任务对话
--author: yuanlan	
--date: 2003/4/28


function twnpc08_Default()

i = random(0,1)						

if (i == 0) then 
Say("老渔翁：别惊动了我的鱼！", 0)
return
end;

if (i == 1) then 
Say("老渔翁：老汉我天天都在这里钓鱼，这儿的鱼都认识我啦。", 0)
end;

end;



