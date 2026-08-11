--description: 天忍教左护法端木睿50级任务
--author: yuanlan	
--date: 2003/5/19



function trnpc08_UTask_55()
Say("左护法端木睿：你在新一辈的弟子中也算是出类拔萃了，本教就需要像你这样的得力干将，我会奏请教主为你讨封的。", 1, "多谢护法/ok")
end;


function ok()
SetRank(60)
SetTask(4, 60)
AddMagic(148)
AddMagic(149)
AddMagic(150)
Msg2Player("恭喜你终于被封为天忍教的护教使！")
Msg2Player("学会天忍教武功“七杀神拳”。")
Msg2Player("学会天忍教武功“蚀骨血刃”。")
Msg2Player("学会天忍教武功“天魔解体”。")
end;