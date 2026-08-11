--description: 天忍教弟子入门任务
--author: yuanlan	
--date: 2003/5/17



function trnpc01_UTask_8()

if ( HaveItem("禹王剑") == 1) then					--有禹王剑
	DelItem("禹王剑")
	Say("天忍死士：你替本教夺得禹王剑，要什么赏赐吗？", 2, "拜师学艺/yes", "赏银/no")
else									--丢失处理
	Say("系统：真糟糕！你不小心把禹王剑给弄丢了，如果要完成任务，你必须得到禹王剑。", 2, "我再找找/find", "重新做这个任务/redo")		
end

end;


function yes()

if (GetSeries() ~= 3) then							--如果玩家不属于火系
	Say("天忍死士：你的根基与本教路数不合，勉强为之有害无益。虽然不能收你入教，但是本教有言必信，你既然替本教夺得宝剑，本教就送你白银一千两作为报赏！", 0)
	Msg2Player("得到赏银一千两。")
	Earn(1000)
	SetTask(4, 9)
else	if (GetFaction() ~= "") then						--如果玩家已经属于火系的另一门派
		Say("天忍死士：你是丐帮的人？哼！难道想混进来做奸细吗？这里有一千两银子，拿了赏钱快点走！", 0)
		Msg2Player("得到赏银一千两。")
		Earn(1000)
		SetTask(4, 9)
	else									
		Say("天忍死士：好吧，看在你替本教夺得宝剑的份上，就收你入教吧！", 1, "见过师兄/ok")
	end
end;

end;


function no()
Say("天忍死士：这是你的赏银，拿好了！", 0)
Msg2Player("得到赏银一千两。")
Earn(1000)
SetTask(4, 9)
end;	


function ok()
SetFaction("天忍教")    				--玩家加入天忍教
SetCamp(2)
SetCurCamp(2)
AddMagic(135)
SetRank(55)						--设置称号
SetRevPos(49, 28)  					--设置重生点
SetTask(4, 10)		
Msg2Player("加入天忍教，成为了一名杀手。")
Msg2Player("学会天忍教武功“残阳如血”。")
end;


function find()
end;

function redo()
Say("系统：请重新在天忍死士处接受任务。", 0)
Msg2Player("你已选择重新在天忍死士处接受任务。")
SetTask(4, 0)
end;