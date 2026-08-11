--description: 唐门出师任务 竹丝洞第三层宝箱
--author: yuanlan	
--date: 2003/3/13


function main()

UTask_tm = GetTask(2);

if (UTask_tm == 66) then 
	Say(10696 , 2, "要/accept", "不要/refuse")
end;

end;



function accept()
AddEventItem(184); 
Msg2Player("得到一条金腰带。");
SetTask(2, 69);
end;


function refuse()
end;

  	






