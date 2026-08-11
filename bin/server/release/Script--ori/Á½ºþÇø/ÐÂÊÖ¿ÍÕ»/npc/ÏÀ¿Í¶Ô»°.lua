--两湖区 新手客栈 侠客对话

function main(sel)

if (GetCurCamp()==0) and (GetCamp()==0)	then			--新手阵营
	UTask_world12 = GetTask(40);
	UTask_world13 = GetTask(41);
	UTask_world14 = GetTask(42);
	UTask_world15 = GetTask(43);
	UTask_world16 = GetTask(44);
	UTask_world17 = GetTask(45);
	
	if (UTask_world17 == 0) then				--第一次点击
		SetTask(45, 1)
		if (UTask_world12 == 1) and (UTask_world13 == 1) and (UTask_world14 == 1) and (UTask_world15 == 1) and (UTask_world16 == 1) then					--是最后一个被点击者
			Talk(3, "select", "侠客：第一次闯江湖吗？呵呵，看到你就像看到年轻的我一样，年少气盛。", "看你的筋骨资质也都算是上上之选，只是江湖经验尚浅，我来教教你怎么装备武器吧：打开道具栏就可以看到你的装备了，把武器剑拖拽到手部就可以装备了。", "大家都是江湖中人，你初涉江湖，我没有理由不帮你的，我这里有一些装备和银两送给你，或许对你日后有所帮助。")
			if (GetSeries() == 0) then		--金系
				--AddItem(0, 0, 4, 1, 0, 0)
				--AddItem(0, 2, 4, 1, 0, 0)
				--Earn(100)
			end
			if (GetSeries() == 1) then		--木系
				if (GetSex() == 0) then 	--男
					--AddItem(0, 1, 1, 1, 1, 0)
					--AddItem(0, 2, 4, 1, 1, 0)
					--Earn(100)
				else				--女
					--AddItem(0, 1, 2, 1, 1, 0)
					--AddItem(0, 2, 7, 1, 1, 0)
					--Earn(100)
				end										
			end
			if (GetSeries() == 2) then		--水系
				--AddItem(0, 0, 5, 1, 2, 0)
				--AddItem(0, 2, 7, 1, 2, 0)
				--Earn(100)				
			end
			if (GetSeries() == 3) then		--火系
				if (GetSex() == 0) then 	--男
					--AddItem(0, 0, 2, 1, 3, 0)
					--AddItem(0, 2, 4, 1, 3, 0)
					--Earn(100)
				else				--女
					--AddItem(0, 0, 3, 1, 3, 0)
					--AddItem(0, 2, 7, 1, 3, 0)
					--Earn(100)
				end										
			end
			if (GetSeries() == 4) then		--土系
				if (GetSex() == 0) then 	--男
					--AddItem(0, 0, 1, 1, 4, 0)
					--AddItem(0, 2, 4, 1, 4, 0)
					--Earn(100)
				else				--女
					--AddItem(0, 0, 0, 1, 4, 0)
					--AddItem(0, 2, 7, 1, 4, 0)
					--Earn(100)
				end										
			end
		else						--不是最后一个被点击者
			Say("侠客：第一次闯江湖吗？呵呵，看到你就像看到年轻的我一样，年少气盛。看你的筋骨资质也都算是上上之选，只是江湖经验尚浅，我来教教你怎么装备武器吧：打开道具栏就可以看到你的装备了，把武器剑拖拽到手部就可以装备了。", 0)
		end
	return	
	end;

	if (UTask_world17 == 1) then				--非第一次点击	
	Say("侠客：看你的筋骨资质也都算是上上之选，只是江湖经验尚浅，我来教教你怎么装备武器吧：打开道具栏就可以看到你的装备了，把武器剑拖拽到手部就可以装备了。", 0)
	end;

else								--非新手阵营
	Say("侠客：同是天涯沦落人，相逢何必曾相识！", 0)
end;

end;



function select()
--Msg2Player("得到一百两银子和两件基本装备。")
end;