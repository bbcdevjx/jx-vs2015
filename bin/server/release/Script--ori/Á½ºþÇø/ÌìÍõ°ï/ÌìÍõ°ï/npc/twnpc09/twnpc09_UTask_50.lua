--description: 天王帮地护法夏诚50级任务
--author: yuanlan	
--date: 2003/4/28


function twnpc09_UTask_50()

Say("夏诚：最近水寨里盛传洞庭湖出现<color=Red>水怪<color>，害死了附近许多渔民，搞得人心惶惶，你愿意去调查一下这件事吗？", 2, "愿意/yes", "请另派他人/no");
DelItem("五彩石")					--防止重接任务后，玩家捡起任务道具

end;

function yes()
Say("夏诚：有好几个人看见<color=Red>水怪<color>曾在<color=Red>东边<color>的湖面出没过，东边码头附近有个<color=Red>通往洞庭湖底的山洞<color>，我怀疑洞中有古怪。", 0)
SetTask(3, 52)    			
end;

function no()
end;