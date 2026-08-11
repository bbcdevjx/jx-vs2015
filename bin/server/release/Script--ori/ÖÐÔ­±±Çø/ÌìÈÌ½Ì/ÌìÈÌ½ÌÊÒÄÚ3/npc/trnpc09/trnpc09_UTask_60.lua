--description: 天忍教教主完颜宏烈出师任务
--author: yuanlan	
--date: 2003/5/19



function trnpc09_UTask_60()
Say("教主完颜宏烈：本教圣书乃是一卷记载有金国国教——萨满教经文的<color=Red>羊皮书<color>，这卷羊皮书被上任教主封存在了后面的<color=Red>圣洞<color>里，据说凡是闯入圣洞者都有去无回。你身为本教的护教法王，有胆量进入圣洞取回羊皮书吗？", 2, "属下责无旁贷/yes", "属下恐难当此大任/no");
DelItem("羊皮书")					--处理重接任务后，玩家捡起任务道具的情况
end;


function yes()
Say("教主完颜宏烈：老夫果然没有看走眼，你倒是有些胆识！不过在进入圣洞之前，你必须先找到流落在<color=Red>汴京<color>里的<color=Red>五把断剑<color>。", 0);
SetTask(4, 62);  
end;

function no()
Say("教主完颜宏烈：难道你是浪得虚名的吗？", 0);
end;




