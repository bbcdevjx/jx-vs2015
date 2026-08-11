--description: 峨嵋派钻天坡敌人任务战斗死亡
--author: yuanlan	
--date: 2003/3/4



function emenemy01_UTask_enroll()

if ( HaveItem("白玉如意") == 0) then					--没有白玉如意
	AddEventItem("白玉如意") 
	Msg2Player("得到白玉如意")
	SetTask(1, 8)							--临时设置
end;

end;