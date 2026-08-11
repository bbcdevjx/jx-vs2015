--description: 唐门普通弟子 竹海三关入口 非任务对话
--author: yuanlan	
--date: 2003/3/7


function tmnpc01_Default()

UTask_tm = GetTask(2);

if (UTask_tm > 0) and (UTask_tm < 10) then			--尚未入门
--Say("唐门庄丁：只有找到青白紫三柄竹杖后出关，才能加入本门。如果你现在退出，下次再进入竹海三关就必须重新开始，你真的要放弃吗？", 2, "是/yes", "否/no")
Say("唐门庄丁：第一柄<color=Red>青色竹杖<color>你要打败第一关里的<color=Red>大马猴<color>才能得到，想得到<color=Red>白色竹杖<color>你必须去第二关找一个<color=Red>庄丁<color>，最后一柄<color=Red>紫色竹杖<color>在第三关的<color=Red>庄丁<color>手上。得到三柄竹杖后交给<color=Red>出口的庄丁<color>，才能算是过关。", 0)
end;				

if (UTask_tm >=10) and (UTask_tm < 70) then			--已经入门，尚未出师
Say("唐门庄丁：大家都是同门兄弟，你不必再闯这里面的竹海三关了！", 0)
end;				

if (UTask_tm >=70) then						--已经出师
Say("唐门庄丁：本门以暗器和陷阱独步天下，江湖人谁也不敢小觑了咱们！日后行走江湖，可不要堕了本门的威风！", 0)
end;				

end;


--function yes()
--SetPos(3626, 5745);						--把玩家传送出迷宫
--SetTask(2, 0);							--清空状态
--if ( HaveItem("青色竹杖") == 1) then DelItem("青色竹杖") end;	--清除物品	
--if ( HaveItem("白色竹杖") == 1) then DelItem("白色竹杖") end;
--if ( HaveItem("紫色竹杖") == 1) then DelItem("紫色竹杖") end;
--end;	


--function no()
--end;