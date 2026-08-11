--description: 天王帮右使杨湖20级任务
--author: yuanlan	
--date: 2003/4/25


function twnpc03_UTask_20()

Say("杨湖：有探子回报，说<color=Red>武陵山<color>最近出现了一些<color=Red>土匪<color>，冒充天王帮的名头打家劫舍，百姓怨声载道。事关本帮声誉，你愿意去一探土匪的巢穴吗？", 2, "属下责无旁贷/yes", "恐难担此重任/no");
DelItem("一面锦旗")					--防止重接任务后，玩家捡起任务道具

end;

function yes()
Say("杨湖：那帮<color=Red>土匪<color>经常在<color=Red>武陵山东部<color>的<color=Red>白水洞<color>附近出没。", 0)
SetTask(3, 25)    			
end;

function no()
end;