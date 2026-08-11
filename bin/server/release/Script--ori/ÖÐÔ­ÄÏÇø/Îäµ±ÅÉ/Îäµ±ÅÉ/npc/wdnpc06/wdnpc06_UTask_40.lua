--description: 武当派周云泉40级任务
--author: yuanlan	
--date: 2003/5/15



function wdnpc06_UTask_40()

Say("周云泉：你能帮我一个忙吗？掌门要我前往<color=Red>伏牛山鸡冠洞<color>把<color=Red>一封信<color>送给一个叫<color=Red>润娘<color>的人，不巧我突然有点急事，你能替我送一下信吗？", 2, "没问题/yes", "对不起，我还有别的事/no");
DelItem("武当掌门书信")						--防止重接任务后，玩家捡起任务道具
DelItem("润娘的回信")						--防止重接任务后，玩家捡起任务道具
end;

function yes()
Say("周云泉：多谢！<color=Red>润娘<color>就住在<color=Red>伏牛山鸡冠洞<color>里，这封信你收好了。", 0);
Msg2Player("得到掌门送给润娘的一封书信。");
AddEventItem("武当掌门书信");
SetTask(5, 42);	
end;

function no()
Say("周云泉：那我找别人帮忙吧。", 0);
end;