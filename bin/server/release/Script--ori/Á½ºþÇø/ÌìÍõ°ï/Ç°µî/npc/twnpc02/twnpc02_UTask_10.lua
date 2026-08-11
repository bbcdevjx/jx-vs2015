--description: 天王帮前殿 王佐10级任务
--author: yuanlan	
--date: 2003/4/24



function twnpc02_UTask_10()

Say("王佐：你是新加入本帮的兄弟吧？要想升为本帮的侍卫长，必须去<color=Red>北面的天王岛山洞<color>拿到<color=Red>三个鸡血石<color>，你有胆量接受这个挑战吗？", 2, "当然有/yes", "在下武功低微/no");

end;

function yes()
Say("王佐：很好，是条汉子！去<color=Red>北面的天王岛山洞<color>拿到<color=Red>三个鸡血石<color>后再来找我吧！", 0)
SetTask(3, 12)    			
end;

function no()
end;