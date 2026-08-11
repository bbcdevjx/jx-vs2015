--description: 唐门唐云 30级任务
--author: yuanlan	
--date: 2003/3/11



function tmnpc09_UTask_35()

if (HaveItem("火器谱") == 1) then
	Talk(2, "select", "玩家：唐云师叔，我已经找到那些绑匪，替你报了仇，这是夺回的《火器谱》，只要你把它交给掌门，就不会再受责罚了。", "唐云：呜呜呜……我总算等到这一天了，你说，你要什么，我全都给你。")	
else
	Say("系统：真糟糕！你不小心把《火器谱》给弄丢了，如果要完成此任务，你必须得到《火器谱》。", 2, "我再找找/find", "重新做这个任务/redo")
end;

end;


function select()
DelItem("火器谱")
SetRank(28)
SetTask(2, 40)
AddMagic(50)
AddMagic(51)
--AddMagic(52)
Msg2Player("恭喜你！你已升为唐门阶前护卫！")
Msg2Player("学会唐门追心箭。")
Msg2Player("学会唐门青木功。")
end;

	
function find()
end;

function redo()
Say("系统：请重新在祭祖厅唐不染处接受任务。", 0)
SetTask(2, 30)
SetTaskTemp(3, 0)
end;

