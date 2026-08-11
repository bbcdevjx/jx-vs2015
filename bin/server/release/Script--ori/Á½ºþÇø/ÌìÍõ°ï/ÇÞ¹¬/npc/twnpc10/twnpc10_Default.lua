--description: 天王帮寝宫 杨瑛非任务对话
--author: yuanlan	
--date: 2003/4/28


function twnpc10_Default()

UTask_tw = GetTask(3);

if (UTask_tw < 60) then								--尚未接出师任务
Say("杨瑛：金人居心叵测，一直妄图颠覆我中原武林，倘若我们自家兄弟都不能一条心，又怎么能击退敌人呢？", 0)
end;				

if (UTask_tw > 60) and (UTask_tw < 66) then					--已经接到出师任务，尚未完成
Say("杨瑛：<color=Red>《天王遗书》<color>被我放在一个<color=Red>宝箱<color>里，<color=Red>宝箱<color>藏在<color=Red>青螺岛北面的湖边<color>，你要先在岛上找到打开宝箱的<color=Red>钥匙<color>。你此刻就坐船去<color=Red>青螺岛<color>，速去速回，多加小心！", 0)
end;				

if (UTask_tw >= 70) then							--已经出师
Say("杨瑛：离开了天王帮，大家以后仍是肝胆相照的好兄弟！", 0)
end;				

end;



