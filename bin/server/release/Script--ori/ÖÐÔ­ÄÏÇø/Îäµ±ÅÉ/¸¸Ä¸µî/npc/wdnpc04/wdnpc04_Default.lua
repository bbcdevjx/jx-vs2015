--description: 武当派姚石门非任务对话
--author: yuanlan	
--date: 2003/5/14


function wdnpc04_Default()

UTask_wd = GetTask(5);

if (UTask_wd < 20) then								--尚未接20级任务
Say("姚石门：师父待我恩重如山，就像是我的再生父母一样。", 0)
end;				

if (UTask_wd == 22)  then							--已经接到20级任务，尚未完成
Say("姚石门：我记得<color=Red>天蚕道袍<color>是在<color=Red>后山火狼洞<color>弄丢的。", 0)
end;				

if (UTask_wd == 24)  then							--已经接到20级任务，尚未完成
Say("玩家：你去<color=Red>襄阳<color>找<color=Red>杂货店老板<color>想想办法。", 0)
end;

if (UTask_wd > 24) and (UTask_wd < 28) then					--已经接到20级任务，尚未完成
Say("姚石门：没有天蚕道袍，我拿什么向师父他老人家贺寿呢？", 0)
end;				

if (UTask_wd >= 30) and (UTask_wd < 70) then					--已经完成20级任务，尚未出师
Say("姚石门：我越来越觉得师父他老人家的武功深不可测，我这辈子也学不完。", 0)
end;				

if (UTask_wd >= 70) then							--已经出师
Say("姚石门：师父常说“海纳百川，有容则大；壁立千韧，无欲则刚”，我就把这句话送给你吧！", 0)
end;				


end;



