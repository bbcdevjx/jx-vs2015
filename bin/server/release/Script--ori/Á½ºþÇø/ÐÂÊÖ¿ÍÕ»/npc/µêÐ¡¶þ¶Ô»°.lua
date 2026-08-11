--两湖区 新手客栈 店小二对话

function main(sel)

if (GetCurCamp()==0) and (GetCamp()==0)	then			--新手阵营
	UTask_world12 = GetTask(40);
	UTask_world13 = GetTask(41);
	UTask_world14 = GetTask(42);
	UTask_world15 = GetTask(43);
	UTask_world16 = GetTask(44);
	UTask_world17 = GetTask(45);
	
	if (UTask_world13 == 0) then				--第一次点击
		SetTask(41, 1)
		if (UTask_world12 == 1) and (UTask_world14 == 1) and (UTask_world15 == 1) and (UTask_world16 == 1) and (UTask_world17 == 1) then					--是最后一个被点击者
			Talk(5, "select", "店小二：客官有什么吩咐？", "玩家：打听一下，这附近可有什么好去处？", "店小二：嘿，方圆几里也就咱这么一个客栈了，不过您要是想四处走走也行，出了门，只要按一下TAB键，马上附近的地图啊，人物啊什么的都显示出来了。", "您要是嫌小那也行，再按一下TAB试试，整个村子的地形马上就一清二楚了，方便得很哪！", "您要出门吗？我这里正好有点装备和银子送给您，希望对您能有帮助。")
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
			Talk(4, "", "店小二：客官有什么吩咐？", "玩家：打听一下，这附近可有什么好去处？", "店小二：嘿，方圆几里也就咱这么一个客栈了，不过您要是想四处走走也行，出了门，只要按一下TAB键，马上附近的地图啊，人物啊什么的都显示出来了。", "您要是嫌小那也行，再按一下TAB试试，整个村子的地形马上就一清二楚了，方便得很哪！")
		end
	return		
	end;

	if (UTask_world13 == 1) then				--非第一次点击	
	Say("店小二：方圆几里就咱这么一家客栈，您要是想四处走走，只要按一下TAB键，马上附近的地图啊，人物啊什么的都显示出来了，您要是嫌小那也行，再按一下TAB试试，整个村子的地形马上就一清二楚了，方便得很哪！", 0)
	end;

else								--非新手阵营
	Say("店小二：客官要什么吩咐？", 0)
end;

end;



function select()
--Msg2Player("得到一百两银子和两件基本装备。")
end;