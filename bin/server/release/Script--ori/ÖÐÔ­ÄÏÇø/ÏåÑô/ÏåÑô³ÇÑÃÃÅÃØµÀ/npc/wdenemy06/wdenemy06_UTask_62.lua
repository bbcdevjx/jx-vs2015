--description: 襄阳城衙门秘道敌人 武当派出师任务战斗死亡
--author: yuanlan	
--date: 22003/5/17



function wdenemy06_UTask_62()

UTask_wdsub04 = GetTask(19);

if (UTask_wdsub04 == 2) then						
	Talk(2, "", "玩家：狗官，记住！以后不准再欺压百姓，否则，天下英雄都不会放过你！", "襄阳守将：不敢了！我再也不敢了！")
	Msg2Player("成功教训了襄阳守将。")
	SetTask(19, 5)
end

end;

