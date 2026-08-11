--description: 唐门唐鹤 10级任务
--author: yuanlan	
--date: 2003/3/10



function tmnpc05_UTask_10()

Say("唐鹤：昨日本座弟子在<color=Red>成都府<color>办事的时候，不小心被扒手偷走了本门的独门暗器<color=Red>魔雨针<color>，这件事让掌门大发雷霆，谁要是能帮本座找回魔雨针，本座重重有赏！", 2, "帮助寻找/accept", "不关我事/refuse");
DelItem("魔雨针")							--防止重接任务后，玩家捡起任务道具

end;


function accept()
Say("唐鹤：<color=Red>魔雨针<color>是在<color=Red>成都府<color>丢失的，你可以先到城里暗中打听一番。对了，你还没有见过<color=Red>魔雨针<color>吧？它是一种象蚊须一样的细针，通体漆黑。", 0)
SetTask(2, 12);
end;


function refuse()
Say("唐鹤：本门暗器丢失，你怎么能说不关你事呢？", 0)
end;



	


