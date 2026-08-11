--description: 唐门唐云 非任务对话
--author: yuanlan	
--date: 2003/3/11


function tmnpc09_Default()

UTask_tm = GetTask(2);

if (UTask_tm < 40) then								--尚未完成30级任务
Say("唐云：小川，我可怜的孩子……此仇此恨，一天不报，我死不瞑目！", 0)
end;				

if (UTask_tm >= 40) and (UTask_tm < 70) then					--已经完成30级任务，尚未出师
Say("唐云：你帮我报此大仇，你说，你要什么，我全都给你。", 0)
end;				

if (UTask_tm >= 70) then							--已经出师
Say("唐云：江湖险诈，你孤身一人行走江湖，要多加小心！", 0)
end;				

end;


