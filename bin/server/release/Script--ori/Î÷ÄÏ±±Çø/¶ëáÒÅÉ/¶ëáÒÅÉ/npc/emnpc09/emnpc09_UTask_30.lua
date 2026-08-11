--description: 峨嵋派穆云慈30级任务
--author: yuanlan	
--date: 2003/3/5



function emnpc09_UTask_30()

Say("穆云慈：我养的<color=Red>火狐<color>不见了，真急死我了，你能帮我找找吗？", 2, "帮助寻找/accept", "没时间/refuse");
DelItem("火狐");				--防止重接任务后，玩家捡起任务道具

end;


function accept()

Say("穆云慈：太好了，麻烦你到<color=Red>后山湖边<color>找找看。哦，差点忘了，火狐最爱吃<color=Red>鸡腿<color>，你得用鸡腿引它回来，否则它不会和陌生人走的。", 0);
SetTask(1, 35);

end;


function refuse()
end;


   








