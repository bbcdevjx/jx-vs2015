--description: 峨嵋派妙隐相公10级任务
--author: yuanlan	
--date: 2003/3/4



function emnpc11_UTask_12()
Talk(3, "select", "玩家：妙隐师姐已经把你们的事情告诉我了，我会想办法帮助你们破镜重圆，你能把另一半镜子给我吗？", "妙隐相公：那就拜托你了，你打算怎么做？", "玩家：我到成都找铁匠试试，看看有什么办法。");
end;



function select()
AddEventItem("右半面铜镜");
Msg2Player("得到右半面铜镜。");
SetTask(1, 14);
end;





