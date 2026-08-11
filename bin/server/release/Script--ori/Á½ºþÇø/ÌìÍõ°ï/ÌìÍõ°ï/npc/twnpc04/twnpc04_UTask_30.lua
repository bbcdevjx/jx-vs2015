--description: 天王帮左使古柏30级任务
--author: yuanlan	
--date: 2003/4/25


function twnpc04_UTask_30()

Say("古柏：说起来真是倒霉，我前些日子去了一趟<color=Red>苗岭燕子洞<color>，结果不小心把<color=Red>天王令<color>给弄丢了，天王令是本帮信物，如果落到居心叵测的人手上，后果不堪设想……", 2, "帮助寻找天王令/yes", "不关我事/no");
DelItem("天王令")						--防止重接任务后，玩家捡起任务道具

end;


function yes()
Say("古柏：太好了！<color=Red>天王令<color>是在<color=Red>苗岭燕子洞<color>丢失的，如果你能帮我找回来，我保举你做掌舵头领。", 0)
SetTask(3, 32)    			
end;

function no()
end;