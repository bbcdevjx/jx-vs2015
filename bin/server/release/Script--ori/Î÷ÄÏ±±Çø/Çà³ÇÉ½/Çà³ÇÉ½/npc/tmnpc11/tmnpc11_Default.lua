--description: 唐门耿子奇 非任务对话
--author: yuanlan	
--date: 2003/3/12


function tmnpc11_Default()

UTask_tm = GetTask(2);

if (UTask_tm < 44) then								--尚未完成40级任务
Say("耿子奇：我毕生最大的恨事，就是我最好的朋友竟然是一个无情无义之辈！", 0)
end;				

if (UTask_tm >= 44) and (UTask_tm < 48) then					--尚未完成40级任务
Say("耿子奇：你真的有办法救我女儿吗？", 0)
end;				

if (UTask_tm >= 48) and (UTask_tm < 70) then					--已经完成40级任务，尚未出师
Say("耿子奇：我误会了你师叔，实在惭愧啊。", 0)
end;				

if (UTask_tm >= 70) then							--已经出师
Say("耿子奇：没有你，我的女儿肯定活不了，你真是我们父女的大恩人！", 0)
end;				

end;


