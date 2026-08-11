--description: 武当派道一真人10级任务
--author: yuanlan	
--date: 2003/5/14



function wdnpc02_UTask_15()

Task0014 = GetTaskTemp(14);

if ( Task0014 == 0 )  then
	Say("道一真人：记熟了吗？为师要考考你，听清楚了--《道德经》第1章的开篇第一句话是什么？", 3, "道生一，一生二，二生三，三生万物/no", "人法地，地法天，天法道，道法自然/no", "道可道，非常道；名可名，非常名/yes1")
end;

if ( Task0014 == 1 )  then
	Say("道一真人：下一个问题：“大象无形”的“大象”是指的什么？", 3, "一种动物/no", "最大的形状/yes2", "太像了/no")
end;

if ( Task0014 == 2 )  then
	Say("道一真人：最后一个问题：“知人者智，自知者明”的后面一句是什么？", 3, "大直若曲，大巧若拙/no", "胜人者有力，自胜者强/yes3", "祸兮，福之所倚；福兮，祸之所伏/no")
end;

end;


function yes1()
Say("道一真人：不错不错。", 0);
SetTaskTemp(14, 1);
end;


function yes2()
Say("道一真人：很好。", 0);
SetTaskTemp(14, 2);
end;


function yes3()
Say("道一真人：看来你的确下了一番功夫，很好。", 1, "师父过奖了/ok1");
end;


function no()
Say("道一真人：看来你没有下苦功啊，读熟了《道德经》以后再来吧。", 0);
end;	


function ok1()
SetRank(8)
SetTask(5, 20)
AddMagic(151)
AddMagic(152)
AddMagic(154)
Msg2Player("恭喜你！你经过修行，已经升为闲散道人了！")
Msg2Player("学会武当剑法。")
Msg2Player("学会武当拳法。")
Msg2Player("学会武当派武功“阴阳气”。")
end