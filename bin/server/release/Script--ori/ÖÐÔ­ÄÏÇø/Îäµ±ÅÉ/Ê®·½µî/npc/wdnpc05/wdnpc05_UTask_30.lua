--description: 武当派徐岱岳30级任务
--author: yuanlan	
--date: 2003/5/14



function wdnpc05_UTask_30()
Talk(2, "select", "徐岱岳：你在武当学艺也有些时日了，我想考考你的武功，看看是否有所进境。", "具体方法是要你在规定时间里，到伏牛山上采回五株画眉草，如果超过规定时间或者采的数目不够，都算失败。");
DelItem("画眉草")
DelItem("画眉草")
DelItem("画眉草")
DelItem("画眉草")
DelItem("画眉草")
end;


function select()
Say("徐岱岳：你有信心接受这次考验吗？", 2, "没问题/yes", "弟子能力微薄，恐难完成任务/no");
end;

function yes()
Say("徐岱岳：很好，从此刻开始计时，你要在<color=Red>二十四个时辰<color>里去<color=Red>伏牛山<color>采回<color=Red>五株画眉草<color>，去吧。", 0);
SetTimer(345600, 2)										--开启计时器
SetTask(5, 32);	
end;

function no()
Say("徐岱岳：那你可要勤加练习了！", 0);
end;




