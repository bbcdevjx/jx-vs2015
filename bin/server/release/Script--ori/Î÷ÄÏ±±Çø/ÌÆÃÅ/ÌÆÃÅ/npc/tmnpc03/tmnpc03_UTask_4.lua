--description: 唐门普通弟子 竹海第二关 入门任务
--author: yuanlan	
--date: 2003/3/10



function tmnpc03_UTask_4()

if ( HaveItem(33) == 1) then
	Say(10782 , 3, "4、9、2/False1", "2、4、9/False1", "2、9、4/True1")
else
	Say(10783 , 0)
	SetTask(2, 2)
end;

end;

	
function False1()
Say(10784 , 0);
end;


function True1()
Say(10785 , 3, "7、5、3/True2", "5、3、7/False2", "5、7、3/False2");
end;


function False2()
Say(10786 , 0);
end;


function True2()
Say(10787 , 3, "6、8、1/False3", "8、1、6/False3", "6、1、8/True3");
end;	


function False3()
Say(10788 , 0);
end;


function True3()
Say(10789 , 0);
AddEventItem(34);
Msg2Player("得到白色竹杖。");
SetTask(2, 6);
end;	

	



