--description: 天王帮地护法夏诚非任务对话
--author: yuanlan	
--date: 2003/4/28


function twnpc09_Default()

UTask_tw = GetTask(3);

if (UTask_tw < 50) then								--尚未接50级任务
Say("夏诚：近来湖面上常泛出五彩奇芒，不知是凶是吉……", 0)
end;				

if (UTask_tw > 50) and (UTask_tw < 55) then					--已经接到50级任务，尚未完成
Say("夏诚：有好几个人看见<color=Red>水怪<color>曾在<color=Red>东边<color>的湖面出没过，东边码头附近有个<color=Red>通往洞庭湖底的山洞<color>，我怀疑洞中有古怪。", 0)
end;				

if (UTask_tw > 55) and (UTask_tw < 70) then					--已经完成50级任务，尚未出师
Say("夏诚：如今天下局势纷乱，但愿天佑本帮！", 0)
end;				

if (UTask_tw >= 70) then							--已经出师
Say("夏诚：一日为兄弟，终生是手足，你要多保重！", 0)
end;				

end;



