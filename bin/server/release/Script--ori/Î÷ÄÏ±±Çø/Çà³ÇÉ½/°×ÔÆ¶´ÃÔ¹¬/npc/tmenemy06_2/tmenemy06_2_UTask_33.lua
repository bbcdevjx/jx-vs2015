--description: 唐门30级任务 青城山白云洞怪物战斗死亡
--author: yuanlan	
--date: 2003/3/11



function tmenemy06_2_UTask_33()

--Task0003 = GetTaskTemp(3)

--if (Task0003 == 1) then	
	if ( HaveItem("钥匙一") == 0) then					--没有钥匙一
		i = random(0,2)							--概率为33%
		if (i == 0) then 
			AddEventItem("钥匙一") 
			Msg2Player("得到一把钥匙。")
		end;			
	end;	

--end;
	
end;


