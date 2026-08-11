--description: 天忍教弟子非任务对话
--author: yuanlan	
--date: 2003/5/17


function trnpc01_Default()

UTask_tr = GetTask(4);

if (UTask_tr < 8) then 					--尚未入门
	Say("天忍死士：<color=Red>禹王剑<color>就藏在<color=Red>华山<color>上，此去华山路途遥远，路上凶险重重，你可以到<color=Red>汴京<color>坐马车去华山附近的<color=Red>凤翔<color>，也可以请本教的<color=Red>日月坛主乌合萨<color>护送你前往，不过你恐怕得花些银子才请得动他。", 0)
else
	if (UTask_tr < 70) then   				--已经入门，尚未出师
		Say("天忍死士：你知道吗？本教风堂堂主可是当今大金皇帝的宝贝七公主，不仅长得极美，而且武功也臻于一流，连教主对她也要礼让三分呢！", 0)
	else							--已经出师
		Say("天忍死士：你要去南边了吗？听说中原武林高手如云，真想去见识见识。", 0)
	end
end;	

end;



