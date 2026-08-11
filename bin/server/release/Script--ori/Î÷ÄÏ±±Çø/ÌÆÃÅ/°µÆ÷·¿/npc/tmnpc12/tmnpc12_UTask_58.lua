--description: 唐门唐闲 50级任务
--author: yuanlan	
--date: 2003/3/12



function tmnpc12_UTask_58()

if ( HaveItem("暗器谱") == 1) then					--有暗器谱
	Talk(2, "select2", "玩家：唐闲师叔，原来偷《暗器谱》的人是三师兄唐禾，我已经把秘笈夺回来，你看是不是真的？", "唐闲：不错，这就是那本遗失的《暗器谱》，你为本堂消解了一场弥天大祸，真是功劳不小啊！")
else
	Say("唐闲：虽然找出了叛徒唐禾，但是不把暗器谱找回来，不仅老夫脱不了干系，还会牵连许多无辜的人。", 0)
end;	

end;


function select2()
DelItem("暗器谱")
SetRank(30)	
SetTask(2, 60)
AddMagic(57)
AddMagic(58)
--AddMagic(59)
Msg2Player("恭喜你！你已升为唐门四老门人！")
Msg2Player("学会唐门武功“冰魄寒光”。")
Msg2Player("学会唐门武功“天罗地网”。")
end;


	


