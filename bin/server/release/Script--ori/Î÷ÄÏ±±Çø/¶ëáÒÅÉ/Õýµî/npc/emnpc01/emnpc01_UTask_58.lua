--description: 峨嵋派清晓师太50级任务
--author: yuanlan	
--date: 2003/3/6


function emnpc01_UTask_58()

Say("清晓师太：这件事情你办得很好，你天资聪颖，只要继续努力，将来一定会学有所成。", 1, "多谢师父教诲/ok2");

end;


function ok2()
SetRank(18);
SetTask(1, 60);
AddMagic(91);
AddMagic(92);
AddMagic(93);
Msg2Player("恭喜你！你已升为峨嵋派散花天女！");
Msg2Player("学会武功“佛光普照”。");
Msg2Player("学会武功“佛心慈佑”。");
Msg2Player("学会武功“慈航普渡”。");
end;