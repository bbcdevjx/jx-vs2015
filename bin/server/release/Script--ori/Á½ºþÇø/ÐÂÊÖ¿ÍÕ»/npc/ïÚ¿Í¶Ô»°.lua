--两湖区 新手客栈 镖客对话

function main(sel)

if (GetCurCamp()==0) and (GetCamp()==0)	then			--新手阵营
	UTask_world12 = GetTask(40);
	UTask_world13 = GetTask(41);
	UTask_world14 = GetTask(42);
	UTask_world15 = GetTask(43);
	UTask_world16 = GetTask(44);
	UTask_world17 = GetTask(45);
	
	if (UTask_world14 == 0) then				--第一次点击
		SetTask(42, 1)
		if (UTask_world12 == 1) and (UTask_world13 == 1) and (UTask_world15 == 1) and (UTask_world16 == 1) and (UTask_world17 == 1) then					--是最后一个被点击者
			Talk(5, "select", "镖客：这一路从山东保镖过来可真够累的，干我们走镖这行的，行遍天下，到哪儿都有朋友，要是有难，叫上一声，包准就有一大批兄弟赶来帮忙。俗话说得好啊，出门靠朋友嘛。", "玩家：哪儿有叫一声马上就有人的？这么快？是飞鸽传书吗？", "镖客：飞鸽传书？你也太小看人了，瞧着，按一下回车键就可以输入你想说的话了，要是选择门派玩家为对象，那么你的师兄弟都能看到你的话。", "再瞅瞅上面那个聊天按扭，看到了没有？按下去就有好友列表出来了，在这里能查找或添加朋友，还能跟好友私聊呢，所以说嘛，剑侠的江湖到处都是朋友。", "看样子你也是一个初出江湖的，俗话说在家靠父母，出门靠朋友，你我也算是有缘人，这样吧，我送你一些装备和银子，希望能够对你有所帮助。")
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
			Talk(4, "", "镖客：这一路从山东保镖过来可真够累的，干我们走镖这行的，行遍天下，到哪儿都有朋友，要是有难，叫上一声，包准就有一大批兄弟赶来帮忙。俗话说得好啊，出门靠朋友嘛。", "玩家：哪儿有叫一声马上就有人的？这么快？是飞鸽传书吗？", "镖客：飞鸽传书？你也太小看人了，瞧着，按一下回车键就可以输入你想说的话了，要是选择门派玩家为对象，那么你的师兄弟都能看到你的话。", "再瞅瞅上面那个聊天按扭，看到了没有？按下去就有好友列表出来了，在这里能查找或添加朋友，还能跟好友私聊呢，所以说嘛，剑侠的江湖到处都是朋友。")
		end	
	return		
	end;

	if (UTask_world14 == 1) then				--非第一次点击
	Say("镖客：只要按一下回车键，就可以输入你想说的话，要是选择门派玩家为对象，那么你的师兄弟都能看到你的话。再瞅瞅上面那个聊天按扭，按下去就有好友列表出来了，在这里能查找或添加朋友，还能跟好友私聊呢，所以说嘛，剑侠的江湖到处都是朋友。", 0)
	end;

else								--非新手阵营
	Say("镖客：在家靠父母，出门靠朋友，行走江湖的人，没有朋友怎么行？", 0)
end;

end;


function select()
--Msg2Player("得到一百两银子和两件基本装备。")
end;

