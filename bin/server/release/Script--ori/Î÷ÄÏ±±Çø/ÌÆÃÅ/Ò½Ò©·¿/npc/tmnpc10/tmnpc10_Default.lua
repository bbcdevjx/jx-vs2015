--description: 唐门唐野 非任务对话
--author: yuanlan	
--date: 2003/3/12


function tmnpc10_Default()

UTask_tm = GetTask(2);

if (UTask_tm < 40) then								--尚未接到40级任务
Say("唐野：我唐某人一生我行我素，只有一件事，直到今天仍然令老夫耿耿于怀——唉！", 0)
end;				

if (UTask_tm > 40) and (UTask_tm < 46) then					--尚未完成40级任务
Say("唐野：<color=Red>耿子奇<color>一直隐居在<color=Red>青城山的西部<color>。", 0)
end;				

if (UTask_tm >= 46) and (UTask_tm < 50) then					--尚未完成40级任务
Say("唐野：药材一共有五种：<color=Red>蟾蜍的皮<color>，<color=Red>毒蛇的胆<color>、<<color=Red>罂粟的壳<color>、<color=Red>毒蝎的尾<color>、<color=Red>僵蚕的头<color>，这些药材在<color=Red>青城山东北<color>的<color=Red>青阳峰<color>比较多，不过那里常有<color=Red>黑鹰<color>、<color=Red>凶鹫<color>、<color=Red>灵雕<color>出没，你要小心。", 0)
end;				

if (UTask_tm >= 50) and (UTask_tm < 70) then					--已经完成40级任务，尚未出师
Say("唐野：你帮老夫化解了这段十年的恩怨，老夫交了你这个朋友！哈哈哈哈！", 0)
end;				

if (UTask_tm >= 70) then							--已经出师
Say("唐野：有空别忘了回来被老夫喝杯酒。", 0)
end;				

end;


