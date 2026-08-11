--description: 峨嵋派妙隐相公非任务对话
--author: yuanlan	
--date: 2003/3/4


function emnpc11_Default()

UTask_em = GetTask(1);

if (UTask_em == 16) then 					--铜镜已补好
	Talk(2, "", "玩家：大哥，看！我已经把铜镜修好了！", "妙隐相公：太好了，你快去把铜镜交给我娘子吧！")
return	
end;

if (UTask_em == 18) then 					--铜镜已补好
	Say("妙隐相公：麻烦你告诉我娘子，别说三年，就是三十年，我也会等下去的！", 0)
return	
end;

if (UTask_em < 12) then   						
	Say("妙隐相公：我们夫妻什么时候才能够团聚呢？", 0)
else									
	if (UTask_em < 17) then   					
		Say("妙隐相公：拜托你了！", 0)
	else								
		Say("妙隐相公：别说三年，就是三十年，我也会等下去的！", 0)
	end
end;	

end;




