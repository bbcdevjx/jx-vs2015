--两湖区 新手客栈 采药人对话

function main(sel)

if (GetCurCamp()==0) and (GetCamp()==0)	then			--新手阵营
	UTask_world12 = GetTask(40);
	UTask_world13 = GetTask(41);
	UTask_world14 = GetTask(42);
	UTask_world15 = GetTask(43);
	UTask_world16 = GetTask(44);
	UTask_world17 = GetTask(45);
	
	if (UTask_world16 == 0) then				--第一次点击
		SetTask(44, 1)
		if (UTask_world12 == 1) and (UTask_world13 == 1) and (UTask_world14 == 1) and (UTask_world15 == 1) and (UTask_world17 == 1) then					--是最后一个被点击者
			Talk(4, "select", "采药人：采药这行可是有大学问的，上古药书《黄帝内经》中记载了不少回春良药，这好药啊，不仅能治病，对学武的人也是有很大帮助的。", "比如上等药材所制的金创药，就能在很短的时间内止血并且有活血生血的效用。而长白山何首乌这样的名贵药材更是能快速恢复内力。", "您要是有这样的好药，可得赶紧放在左下方的快捷栏中，可以使用数字快捷键来快速使用，遇到敌人的时候，这可是很重要的哦。", "像你这样年纪轻轻，一个人在外闯荡可不易啊，别的我也帮不上什么忙，我这正好有一些用不上的装备和一点碎银子，你拿去使吧！")
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
			Talk(3, "", "采药人：采药这行可是有大学问的，上古药书《黄帝内经》中记载了不少回春良药，这好药啊，不仅能治病，对学武的人也是有很大帮助的。", "比如上等药材所制的金创药，就能在很短的时间内止血并且有活血生血的效用。而长白山何首乌这样的名贵药材更是能快速恢复内力。", "您要是有这样的好药，可得赶紧放在左下方的快捷栏中，可以使用数字快捷键来快速使用，遇到敌人的时候，这可是很重要的哦。")
		end
	return		
	end;

	if (UTask_world16 == 1) then				--非第一次点击	
		Say("采药人：好药对学武的人是有很大帮助的，您要是有了名贵的药材，可得赶紧放在左下方的快捷栏中，可以使用数字快捷键来快速使用，遇到敌人的时候，这可是很重要的哦。", 0)
	end;

else								--非新手阵营
	Say("采药人：好药对行走江湖的人是非常重要的。", 0)
end;

end;



function select()
--Msg2Player("得到一百两银子和两件基本装备。")
end;