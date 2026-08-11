--description: 天忍教火堂堂主10级任务
--author: yuanlan	
--date: 2003/5/18



function trnpc02_UTask_10()
Say("火堂堂主兀敖：本教第二层的<color=Red>七杀洞<color>里关押了<color=Red>七个死囚<color>，他们都是本教的叛徒，如果你能够打败这七个家伙，得到<color=Red>七块七杀令牌的碎片<color>，就可以晋级为本教的无影杀手，你有没有胆量去闯七杀洞啊？", 2, "闯七杀洞/yes", "暂时不闯/no");
DelItem("令牌碎片一")
DelItem("令牌碎片二")
DelItem("令牌碎片三")
DelItem("令牌碎片四")
DelItem("令牌碎片五")
DelItem("令牌碎片六")
DelItem("令牌碎片七")					--防止重接任务后，玩家捡起任务道具 
end;


function yes()
Say("火堂堂主兀敖：<color=Red>七杀令牌的碎片<color>一共有七块，分别在<color=Red>七个死囚<color>身上，必须全部得到才算过关。", 0);
SetTask(4, 15);  
end;

function no()
Say("火堂堂主兀敖：有胆量闯洞的时候再来找我。", 0);
end;




