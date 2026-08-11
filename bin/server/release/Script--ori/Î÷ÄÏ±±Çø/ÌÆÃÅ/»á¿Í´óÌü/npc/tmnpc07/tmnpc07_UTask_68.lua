--description: 唐门唐仇 出师任务
--author: yuanlan	
--date: 2003/3/13



function tmnpc07_UTask_68()

if (HaveItem("七星绝命剑") == 1) then
	Talk(3, "select2", "玩家：掌门，我在竹丝洞里之找到了这把破剑，它不会就是传说中的七星绝命剑吧？", "唐仇：不错，这正是七星绝命剑！别看它残破，它的价值就在于你对它的取舍。你放弃金钱和宝藏而选择它，说明你在面对诱惑的时候，仍能保持对本门的忠诚，很好！很好！你已经通过考验，可以顺利出师了！", "恭喜你艺成出师！你已被封为唐门的千手神卫，从今以后可以自由行走江湖啦！你可以选择加入别的门派继续学艺，也可以去创建帮会扩展自己的江湖势力，又或者做一个独行客也不错啊！剑侠江湖，天高海阔，希望你能大展拳脚，一展鸿图！")	
else
	Say("系统：真糟糕！你不小心把七星绝命剑给弄丢了，如果要完成此任务，你必须得到七星绝命剑。", 2, "我再找找/find1", "重新做这个任务/redo1")
end;
	
end;



function select2()
DelItem("七星绝命剑")
Msg2Player("恭喜你艺成出师！你已被封为唐门的千手神卫！")
SetRank(66)
SetTask(2, 70)
SetFaction("")				    			--玩家退出唐门
SetCamp(4)
SetCurCamp(4)
end;


function find1()
end;

function redo1()
Say("系统：请重新在唐仇处接受任务。", 0)
SetTask(2, 60)
end;	


