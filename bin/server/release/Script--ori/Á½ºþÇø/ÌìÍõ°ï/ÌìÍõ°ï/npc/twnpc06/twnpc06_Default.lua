--description: 天王帮渔妇荷嫂非任务对话
--author: yuanlan	
--date: 2003/4/28


function twnpc06_Default()

i = random(0,1)						

if (i == 0) then 
Say("渔妇荷嫂：我男人是个老实人，到现在还只是个副道领，不知什么时候才能出人头地。", 0)
return
end;

if (i == 1) then 
Say("渔妇荷嫂：在本帮的众多护法里，路老护法对属下们最宽容，夏护法话最少，王前使为人最耿直，杨右使最精明能干，古左使嘛……做人最圆滑。", 0)
end;

end;



