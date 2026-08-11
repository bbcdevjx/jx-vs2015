--description: 武当派单思南非任务对话
--author: yuanlan	
--date: 2003/5/16


function wdnpc08_Default()

UTask_wd = GetTask(5);

if (UTask_wd < 50) then								--尚未接50级任务
Say("单思南：天下纷乱，虎狼成群，怜我世人，忧患实多！我等学武之人，若不能以一己之长，救百姓于水火，岂不愧对“侠义”二字！", 0)
end;				

if (UTask_wd > 50) and (UTask_wd < 55) then					--已经接到50级任务，尚未完成
Say("单思南：那群盗匪的巢穴在<color=Red>伏牛山天心洞<color>，为首的叫<color=Red>铁棘<color>。记住要将从盗匪处所得的<color=Red>银两<color>，全部捐给<color=Red>襄阳城<color>中穷苦的老百姓。", 0)
end;				

if (UTask_wd >= 55) and (UTask_wd < 58) then					--已经接到50级任务，尚未完成
Say("单思南：听说<color=Red>襄阳城<color>里最穷的是住在城北的<color=Red>邓家嫂子<color>，你把从盗匪处所得的<color=Red>全部银两<color>，都送给她吧。", 0)
end;

if (UTask_wd >= 60) and (UTask_wd < 70) then					--已经完成50级任务，尚未出师
Say("单思南：我平生最喜结交那些有情有义之人，大家一起畅游江湖、行侠仗义，岂不快哉？", 0)
end;				

if (UTask_wd >= 70) then							--已经出师
Say("单思南：人生之事，原本聚少离多，也不必太过伤感。天下之大，何处不能有所作为？还望多多保重！", 0)
end;				


end;



