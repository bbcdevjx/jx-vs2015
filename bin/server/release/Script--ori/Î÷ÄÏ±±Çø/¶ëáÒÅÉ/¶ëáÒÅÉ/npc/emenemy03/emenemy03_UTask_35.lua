--description: 峨嵋派火狐水面敌人任务战斗死亡
--author: yuanlan	
--date: 2003/3/5



function emenemy03_UTask_35()

if ( HaveItem("火狐") == 0) then					--没有火狐
	i = random(0,1)							--得到火狐的概率是50%
	if (i == 0) then  
		if ( HaveItem("鸡腿") == 0) then			--没有鸡腿
			Msg2Player("找到火狐，但是没有鸡腿，火狐不肯跟陌生人走。")
		else							--有鸡腿		
			DelItem("鸡腿")
			AddEventItem("火狐") 
			Msg2Player("救出火狐。")
			SetTask(1, 38)
		end			
	end
end;

end;