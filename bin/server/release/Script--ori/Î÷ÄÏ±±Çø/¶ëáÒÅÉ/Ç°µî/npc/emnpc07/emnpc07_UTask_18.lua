--description: 峨嵋派妙隐10级任务
--author: yuanlan	
--date: 2003/3/4



function emnpc07_UTask_18()
Talk(2, "select2", "玩家：妙隐师姐，铜镜我已经交给你相公了，他说会永远等着你。", "妙隐：师妹，我真不知该怎么谢你！");
end;


function select2()
SetRank(14)
SetTask(1, 20)
AddMagic(77)
AddMagic(79)
AddMagic(81)
Msg2Player("恭喜你！你已升为峨嵋派羽衣尼！")
Msg2Player("学会峨眉剑法。")
Msg2Player("学会峨嵋掌法。")
Msg2Player("学会武功“秋风叶”。")
end;





