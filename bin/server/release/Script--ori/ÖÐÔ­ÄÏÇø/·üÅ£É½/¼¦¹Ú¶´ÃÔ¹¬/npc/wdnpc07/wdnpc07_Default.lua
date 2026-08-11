--description: 武当派润娘 非任务对话
--author: yuanlan	
--date: 2003/5/15


function wdnpc07_Default()

UTask_wd = GetTask(5);

if (UTask_wd < 42) then							--尚未接到40级任务
Say("润娘：你是何人？竟敢擅闯本洞，简直不知死活！", 0)
end;		

if (UTask_wd == 45) then						--已经打败五虎，尚未拿到回信
Say("润娘：我的回信就放在这个山洞里，有本事你就找到它吧！。", 0)
end;			

if (UTask_wd >= 48) then						--拿到回信后
Say("润娘：原来他也知道对不起我，唉，早知如此，何必当初！", 0)
end;				
		

end;


