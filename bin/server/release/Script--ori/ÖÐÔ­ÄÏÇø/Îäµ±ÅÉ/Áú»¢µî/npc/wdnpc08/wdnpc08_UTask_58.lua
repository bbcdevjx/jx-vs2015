--description: 武当派单思南50级任务
--author: yuanlan	
--date: 2003/5/16



function wdnpc08_UTask_58()
Talk(2, "select", "玩家：弟子已经将从盗匪处所得银两全部送给了老百姓。", "单思南：做得很好！侠骨丹心，方不愧武当弟子本色！")
end;


function select()
SetRank(12)
SetTask(5, 60)
AddMagic(164)
AddMagic(165)
AddMagic(166)
Msg2Player("恭喜你！你已经升为掌经道人！")
Msg2Player("学会武当派武功“剥及而复”。")
Msg2Player("学会武当派武功“无我无剑”。")
Msg2Player("学会武当派武功“太极神功”。")
end;
