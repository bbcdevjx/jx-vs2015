--description: 唐门唐仇 非任务对话
--author: yuanlan	
--date: 2003/3/13


function tmnpc07_Default()

UTask_tm = GetTask(2);

if (UTask_tm < 10) then								--尚未入门
Say("唐仇：世人都把我唐门看成龙潭虎穴，把我唐仇看成喜怒无常的魔头，哼！又有什么关系！总比那些自诩名门正派的沽名钓誉之徒好上千倍万倍！", 0)
end;				

if (UTask_tm >= 10) and (UTask_tm <= 20) then					--已经入门，尚未接20级任务
Say("唐仇：本门技艺从不外传，倘若门下弟子有人敢泄漏绝技，必按门规处置，绝不轻饶！", 0)
end;				

if (UTask_tm > 20) and (UTask_tm < 26) then					--已经接到20级任务，尚未完成
Say("唐仇：不知幽妹妹过得可好？唉！直到今天，她仍然不肯原谅我这个哥哥……", 0)
end;				

if (UTask_tm >= 30) and (UTask_tm < 60) then					--已经完成20级任务，尚未接到出师任务
Say("唐仇：你帮为师解开了这辈子最大的心结，为师绝不会亏待你。", 0)
end;				

if (UTask_tm > 60) and (UTask_tm < 70) then					--已经接到出师任务，尚未完成
Say("唐仇：只要你能够在<color=Red>竹丝洞<color>中取回一把<color=Red>七星绝命剑<color>，就算通过出师考验了。", 0)
end;				

if (UTask_tm >= 70) then							--已经出师
Say("唐仇：你出师后要好自为之，不可让人小瞧了本门的功夫！", 0)
end;				

end;


