--description: 天王帮天护法路云远40级任务
--author: yuanlan	
--date: 2003/4/26


function twnpc05_UTask_40()
Talk(2, "select", "玩家：路老护法，看您老人家愁闷不展，有什么为难的事吗？", "路云远：我属下弟子吴刚适才在湖边不小心被一种剧毒无比的赤链蛇咬伤，生命危在旦夕，我已经用内力为他驱毒，但是毒气攻心，不能尽除，听说只有<color=Red>巴陵县<color>的<color=Red>吴神医<color>能够医治……")
DelItem("莲子")						--防止重接任务后，玩家捡起任务道具
DelItem("三个鸡蛋")					--防止重接任务后，玩家捡起任务道具
DelItem("五条蚯蚓")					--防止重接任务后，玩家捡起任务道具
DelItem("火蜥蜴鳞片")					--防止重接任务后，玩家捡起任务道具
DelItem("绿毛龟")					--防止重接任务后，玩家捡起任务道具
end;


function select()
Say("路云远：你愿意去一趟<color=Red>巴陵县<color>找<color=Red>吴神医<color>求得解药吗？", 2, "属下愿意/yes", "属下有别的事/no");
end;


function yes()
Say("路云远：好，你快去快回！", 0)
SetTask(3, 42)    			
end;

function no()
end;