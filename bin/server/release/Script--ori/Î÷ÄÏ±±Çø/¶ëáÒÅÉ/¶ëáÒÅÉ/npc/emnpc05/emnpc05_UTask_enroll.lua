--description: 峨嵋派谢云萝入门任务
--author: yuanlan	
--date: 2003/3/3



function emnpc05_UTask_enroll()

Say("谢云萝：既然前面的三位师姐都难不倒你，那么'文'这一关你算是通过了，但是还要过'武'关，这一关里你必须通过钻天坡迎客阵，并且得到<color=Red>白玉如意<color>，你要闯阵吗？", 2, "闯/yes", "不闯/no");
DelItem("白玉如意");		--防止重接任务后，玩家捡起任务道具

end;


function yes()
--SetPos(1766, 5136);				--把玩家传送入迷宫
SetTask(1, 7);
end;


function no()
end;


