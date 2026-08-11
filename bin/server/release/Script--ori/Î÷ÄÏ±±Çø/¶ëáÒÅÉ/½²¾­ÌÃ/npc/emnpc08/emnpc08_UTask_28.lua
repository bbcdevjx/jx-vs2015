--description: 峨嵋派妙如20级任务
--author: yuanlan	
--date: 2003/3/4



function emnpc08_UTask_28()

Say("妙如：你能够深入虎穴，收伏猛虎，真不愧为我峨嵋弟子。", 1, "师姐过奖了/ok");

end;


function ok()
SetRank(15);
SetTask(1, 30);
AddMagic(82);
AddMagic(83);
AddMagic(84);
Msg2Player("恭喜你！你已升为峨嵋派锦衣尼！");
Msg2Player("学会武功“四象同归”。");
Msg2Player("学会武功“望月”。");
Msg2Player("学会武功“风雨飘香”。");
end;




