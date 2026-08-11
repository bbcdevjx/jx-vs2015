--description: 峨嵋派清晓师太出师任务
--author: yuanlan	
--date: 2003/3/6



function emnpc01_UTask_graduate()

Say("清晓师太：掌门信物<color=Red>烟玉指环<color>，乃是本派祖师传下来的镇派之宝。可是在几十年前，本派出了一个叛徒<color=Red>清和<color>，她是为师的师姐，因为对为师接任掌门不满，所以盗走了<color=Red>烟玉指环<color>，你愿意帮本派夺回<color=Red>烟玉指环<color>吗？" , 2, "愿意/accept2", "恐难当此大任/refuse2");
DelItem("烟玉指环");							--防止重接任务后，玩家捡起任务道具

end;


function accept2()
Say("清晓师太：听说最近<color=Red>清和<color>在<color=Red>长江源头<color>附近现身，你要一切小心！", 0)
SetTask(1, 65);
end;


function refuse2()
Say("清晓师太：看来为师只能把这个重任交给别人了。", 0)
end;



