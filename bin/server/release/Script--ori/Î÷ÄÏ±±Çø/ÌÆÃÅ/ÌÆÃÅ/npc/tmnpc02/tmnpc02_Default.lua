--description: 唐门普通弟子 竹海三关出口 非任务对话
--author: yuanlan	
--date: 2003/3/10


function tmnpc02_Default()

UTask_tm = GetTask(2);

if (UTask_tm == 0) then	
Say("唐门庄丁：想成为本门弟子，你必须通过竹海三关，这里是出口，入口在前面。", 0)
end;

if (UTask_tm > 0) and (UTask_tm < 8) then						--尚未入门
Say("唐门庄丁：你必须通过竹海三关，想办法得到青白紫三柄竹杖，才能成为本门弟子。", 0)
end;				

if (UTask_tm >=10) and (UTask_tm < 70) then			--已经入门，尚未出师
Say("唐门庄丁：大家都是同门兄弟，你不必再闯这里面的竹海三关了！", 0)
end;				

if (UTask_tm >=70) then						--已经出师
Say("唐门庄丁：本门以暗器和陷阱独步天下，江湖人谁也不敢小觑了咱们！日后行走江湖，可不要堕了本门的威风！", 0)
end;				

end;


