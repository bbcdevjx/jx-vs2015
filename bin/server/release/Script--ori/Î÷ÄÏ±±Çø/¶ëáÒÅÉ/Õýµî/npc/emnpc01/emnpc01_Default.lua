--description: 峨嵋派清晓师太非任务对话
--author: yuanlan	
--date: 2003/3/6


function emnpc01_Default()

UTask_em = GetTask(1);

if (UTask_em < 8) then 						--尚未入门
Say("清晓师太：我峨嵋一派，传至今日，已有百年，弟子众多，广结善缘，不论是否拜入门墙，上得山来，皆是有缘人。", 0)
end;

if (UTask_em > 8) and (UTask_em < 50) then   			--已经入门，做50级任务以前
Say("清晓师太：我佛慈悲！既入我门，需谨守门规。望你好生学艺，不要辜负了为师的期望！", 0)
end;

if (UTask_em > 50) and (UTask_em < 60) then   			--已经接到50级任务，尚未完成
	if (UTask_em == 55) then
		Say("清晓师太：<color=Red>慈海大师<color>闭关多年，寻常不见外客，你可以先去找他的师弟<color=Red>慈云法师<color>。", 0)
	else		
		Say("清晓师太：《金刚经》送到了吗？", 0)
	end	
end;

if (UTask_em > 60) and (UTask_em < 70) then   			--已经完成50级任务，尚未完成出师任务
Say("清晓师太：<color=Red>烟玉指环<color>乃是镇派之宝，流落在外，实非善策。听说最近<color=Red>清和<color>在<color=Red>长江源头<color>附近现身，你要一切小心！", 0)
end;
				
if (UTask_em >= 70) then   					--完成出师任务
Say("清晓师太：你已出师，日后行走江湖，务必洁身自爱，切记切记！", 0)
end;	

end;



