--description: 唐门唐鹤 非任务对话
--author: yuanlan	
--date: 2003/3/10


function tmnpc05_Default()

UTask_tm = GetTask(2);

if (UTask_tm < 10) then								--尚未接到10级任务
Say("唐鹤：本门虽然以暗器名闻江湖，但是论到武功，也决不会逊于其它门派。", 0)
end;				

if (UTask_tm > 10) and (UTask_tm < 20) then					--已经接到10级任务，尚未完成
Say("唐鹤：<color=Red>魔雨针<color>是在<color=Red>成都府<color>丢失的，你可以先到城里暗中打听一番。对了，你还没有见过<color=Red>魔雨针<color>吧？它是一种象蚊须一样的细针，通体漆黑。", 0)
end;				

if (UTask_tm >= 20) and (UTask_tm < 70) then					--已经完成10级任务，尚未出师
Say("唐鹤：你真有本事，能帮本堂找回魔雨针，只要你好自为之，将来一定前途无量。", 0)
end;				

if (UTask_tm >= 70) then							--已经出师
Say("唐鹤：本门虽然以暗器名闻江湖，但是论到武功，也决不会逊于其它门派。", 0)
end;				

end;


