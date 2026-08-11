--description: 武当派单思南50级任务
--author: yuanlan	
--date: 2003/5/16



function wdnpc08_UTask_50()
Say("单思南：本派弟子以侠义行走天下，身为武当弟子，理应日行一善。最近<color=Red>伏牛山天心洞<color>出现了一群盗匪，为首的叫<color=Red>铁棘<color>，他们专门抢劫来往的商旅，你愿意去为民除害吗？", 2, "义不容辞/yes", "恐难当此重任/no");
end;


function yes()
Say("单思南：很好，不过要记住，所得的<color=Red>银两<color>要全部捐给<color=Red>襄阳城<color>中穷苦的老百姓。", 0);
SetTask(5, 52);	
end;

function no()
Say("单思南：除暴安良乃我等习武之人义不容辞的责任，你何故推脱？", 0);
end;




