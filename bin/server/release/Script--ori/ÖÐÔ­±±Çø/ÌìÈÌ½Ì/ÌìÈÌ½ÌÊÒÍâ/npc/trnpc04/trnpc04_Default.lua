--description: 天忍教小男孩非任务对话
--author: yuanlan	
--date: 2003/5/18


function trnpc04_Default()

UTask_tr = GetTask(4);

if (UTask_tr < 23) then								--尚未回答问题
Say("小男孩：我有一只小黄狗和一头小灰驴，它们可乖啦，是我最好的伙伴。", 0)
end;				

if (UTask_tr == 25) then					--已经回答问题，尚未找到小黄狗和小灰驴
Say("小男孩：如果你能帮我找回丢失的<color=Red>小黄狗<color>和<color=Red>小灰驴<color>，我就把日月双轮还给你。", 0)
end;				

if (UTask_tr > 26) then								--已经找到小黄狗和小灰驴
Say("小男孩：我的小黄狗和小灰驴既能干又忠心，而且从来不说废话，天底下没有比它们更好的啦！", 0)
end;				


end;



