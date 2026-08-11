--description: 峨嵋派妙如20级任务
--author: yuanlan	
--date: 2003/3/4



function emnpc08_UTask_20()

Say("妙如：最近<color=Red>后山山洞<color>常有<color=Red>猛虎<color>出没，伤害了不少上山进香的百姓，我们身为佛门子弟，怎能眼看猛虎伤人而置之不理呢？你愿意去收伏这些恶虎吗？", 2, "愿意/accept", "有心无力/refuse");

end;


function accept()

Say("妙如：擒贼先擒王，你只要收伏了<color=Red>虎王<color>，其余的猛虎自然不敢为非作歹。虎性顽劣，你须得收服它<color=Red>三次<color>，它才会真正降服。", 0);
SetTask(1, 25);

end;


function refuse()
end;


   








