--西南北区 新手客栈 镖客对话

function main(sel)

if (GetCurCamp()==0) and (GetCamp()==0)	then			--新手阵营
	UTask_world06 = GetTask(34);
	UTask_world07 = GetTask(35);
	UTask_world08 = GetTask(36);
	UTask_world09 = GetTask(37);
	UTask_world10 = GetTask(38);
	UTask_world11 = GetTask(39);
	
	if (UTask_world08 == 0) then				--第一次点击
		SetTask(36, 1)
		if (UTask_world06 == 1) and (UTask_world07 == 1) and (UTask_world09 == 1) and (UTask_world10 == 1) and (UTask_world011 == 1) then					--是最后一个被点击者
			Talk(4, "", 10651, 10652, 10653, 10654)
			if (GetSeries() == 0) then		--金系
				AddItem(0, 0, 4, 1, 0, 0)
				AddItem(0, 2, 4, 1, 0, 0)
				Earn(100)
			end
			if (GetSeries() == 1) then		--木系
				if (GetSex() == 0) then 	--男
					AddItem(0, 1, 1, 1, 1, 0)
					AddItem(0, 2, 4, 1, 1, 0)
					Earn(100)
				else				--女
					AddItem(0, 1, 2, 1, 1, 0)
					AddItem(0, 2, 7, 1, 1, 0)
					Earn(100)
				end										
			end
			if (GetSeries() == 2) then		--水系
				AddItem(0, 0, 5, 1, 2, 0)
				AddItem(0, 2, 7, 1, 2, 0)
				Earn(100)				
			end
			if (GetSeries() == 3) then		--火系
				if (GetSex() == 0) then 	--男
					AddItem(0, 0, 2, 1, 3, 0)
					AddItem(0, 2, 4, 1, 3, 0)
					Earn(100)
				else				--女
					AddItem(0, 0, 3, 1, 3, 0)
					AddItem(0, 2, 7, 1, 3, 0)
					Earn(100)
				end										
			end
			if (GetSeries() == 4) then		--土系
				if (GetSex() == 0) then 	--男
					AddItem(0, 0, 1, 1, 4, 0)
					AddItem(0, 2, 4, 1, 4, 0)
					Earn(100)
				else				--女
					AddItem(0, 0, 0, 1, 4, 0)
					AddItem(0, 2, 7, 1, 4, 0)
					Earn(100)
				end										
			end
		else						--不是最后一个被点击者
			Talk(3, "", 10655, 10656, 10657)
		end	
	end;

	if (UTask_world08 == 1) then				--非第一次点击
	Say(10658 , 0)
	end;

else								--非新手阵营
	Say(10659 , 0)
end;

end;




