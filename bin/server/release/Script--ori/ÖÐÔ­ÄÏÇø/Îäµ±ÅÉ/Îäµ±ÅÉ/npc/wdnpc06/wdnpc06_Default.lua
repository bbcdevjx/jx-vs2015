--description: 武当派周云泉非任务对话
--author: yuanlan	
--date: 2003/5/15


function wdnpc06_Default()

UTask_wd = GetTask(5);

if (UTask_wd < 40) then								--尚未接40级任务
Say("周云泉：我自幼在武当山上学艺，将全部精力都放在了武功的修练上，从未想过娶妻生子，如今已过而立之年，心中也不禁有些惆怅。", 0)
end;				

if (UTask_wd == 42) then
Say("周云泉：<color=Red>润娘<color>就住在<color=Red>伏牛山鸡冠洞<color>里。", 0)
end;

if (UTask_wd > 42) and (UTask_wd < 48) then					--已经接到40级任务，尚未完成
Say("周云泉：见到润娘了吗？事情办得怎样？", 0)
end;				

if (UTask_wd >= 50) and (UTask_wd < 70) then					--已经完成40级任务，尚未出师
Say("周云泉：师父和那个润娘的恩怨，我略有所闻，只是师父似乎不愿多提，我们做弟子的也就不好多问。", 0)
end;				

if (UTask_wd >= 70) then							--已经出师
Say("周云泉：咱们能够同门学艺，即是有缘，有缘之人，日后自会相见，望多多保重！", 0)
end;					

end;



