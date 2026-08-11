--description: 天王帮寝宫 杨瑛出师任务
--author: yuanlan	
--date: 2003/4/28



function twnpc10_UTask_60()

Talk(3, "select", "杨瑛：想当年，楚王在洞庭湖起兵，南抗赵宋，北抵金兵，何等英雄！楚王身故后，义军残部推举我爹大圣天王为领袖，继续领导起义。义军发展迅猛，引起朝廷恐慌，派重兵前来剿灭，在那场血战中，我爹不幸被叛徒出卖，力战不屈，在青螺岛被俘殉义！", "我爹牺牲后，我将他的衣冠、佩剑和一本兵书藏在了<color=Red>青螺岛<color>上。那本兵书名为<color=Red>《天王遗书》<color>，里面不仅记载了我爹生前行军布阵的心得与密要，而且还详细记录了洞庭湖地区的军事要地和水路要塞，因此对于本帮而言乃是一本十分重要的密书。", "可是最近不知被谁走漏了消息，这本书被金国打探到，他们派了大量杀手前往<color=Red>青螺岛<color>，想去抢夺这本书。"); 
DelItem("天王遗书")					--防止重接任务后，玩家捡起任务道具
end;


function select()
Say("杨瑛：<color=Red>《天王遗书》<color>绝不能落入金人之手，现在我派你去一趟<color=Red>青螺岛<color>，赶在金人前面，将<color=Red>《天王遗书》<color>取回来，你愿意担此重任吗？", 2, "属下责无旁贷/yes", "恐难当此重任/no");
end;


function yes()
Say("杨瑛：<color=Red>《天王遗书》<color>被我放在一个<color=Red>宝箱<color>里，<color=Red>宝箱<color>藏在<color=Red>青螺岛北面的湖边<color>，你要先在岛上找到打开宝箱的<color=Red>钥匙<color>。你此刻就坐船去<color=Red>青螺岛<color>，速去速回，多加小心！", 0)
SetTask(3, 62)    			
end;

function no()
end;