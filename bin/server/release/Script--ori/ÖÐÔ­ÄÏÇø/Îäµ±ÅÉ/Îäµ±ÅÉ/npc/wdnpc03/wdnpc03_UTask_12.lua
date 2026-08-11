--description: 武当派叶继美10级任务
--author: yuanlan	
--date: 2003/5/14



function wdnpc03_UTask_12()

Say("叶继美：《道德经》乃道教祖师老子所著，上篇道经共三十七章，下篇德经共四十四章。《道德经》的内容博大精深，不是一时间能够领悟的，你先记熟其中的五章吧。", 5, "第1章/ch1", "第25章/ch2", "第33章/ch3", "第41章/ch4", "第42章/ch5");

end;


function ch1()
Say("叶继美：道可道，非常道；名可名，非常名。", 0);
SetTask(5, 15)    			
end;


function ch2()
Say("叶继美：人法地，地法天，天法道，道法自然。", 0);
SetTask(5, 15)    			
end;

function ch3()
Say("叶继美：知人者智，自知者明；胜人者有力，自胜者强。", 0);
SetTask(5, 15)    			
end;

function ch4()
Say("叶继美：大方无隅，大器晚成，大音希声，大象无形。", 0);
SetTask(5, 15)    			
end;

function ch5()
Say("叶继美：道生一，一生二，二生三，三生万物。", 0);
SetTask(5, 15)    			
end;