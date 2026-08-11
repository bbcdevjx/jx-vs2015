--西南北区 新手客栈 掌柜对话

function main(sel)

if (GetCurCamp()==0) and (GetCamp()==0)	then			--新手阵营
	UTask_world06 = GetTask(34);
	UTask_world07 = GetTask(35);
	UTask_world08 = GetTask(36);
	UTask_world09 = GetTask(37);
	UTask_world10 = GetTask(38);
	UTask_world11 = GetTask(39);

	if (UTask_world06 == 0) then				--第一次点击
		SetTask(34, 1)
		if (UTask_world07 == 1) and (UTask_world08 == 1) and (UTask_world09 == 1) and (UTask_world10 == 1) and (UTask_world11 == 1) then					--是最后一个被点击者
			Say("掌柜：呵呵，客官看来是第一次出门吧，外面的世界挑战多着呢！你不仅需要经验，还得有一两套基本的装备才行，银子也不能少，没钱可寸步难行啊。我这里有点装备和银子送给你，希望对你能有帮助。", 1, "多谢您啦/ok")
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
			Say("掌柜：呵呵，客官看来是第一次出门吧，咱们这村虽是小地方，可也是地处要道，南来北往的人多了去了，您初来乍到的，没事多跟江湖上的人聊聊，可是能学到不少东西呢。", 0)
		end
	return				
	end;

	if (UTask_world06 == 1) then				--非第一次点击	
	Say("掌柜：咱们这村虽是小地方，可也是地处要道，南来北往的人多了去了，您没事多跟江湖上的人聊聊，可是能学到不少东西呢。", 0)
	end;

else								--非新手阵营
	Say("掌柜：咱们这村虽是小地方，可也是地处要道，南来北往的人可多了去了。", 0)
end;

end;


function ok()
--Msg2Player("得到一百两银子和两件基本装备。")
end;