--description: 天忍教左护法端木睿50级任务
--author: yuanlan	
--date: 2003/5/19



function trnpc08_UTask_50()
Say("左护法端木睿：本教<color=Red>星坛坛主凤翕如<color>被宋兵抓去，关押在<color=Red>汴京<color>的一座<color=Red>铁塔<color>里面，如果宋兵从他口中逼问出什么秘密，将对本教大业十分不利，因此不论死活，你都要把凤翕如救出来。", 2, "属下遵命/yes", "属下恐难当此大任/no");
end;


function yes()
Say("左护法端木睿：关押<color=Red>凤翕如<color>的<color=Red>汴京铁塔<color>一共有<color=Red>三道机关<color>，打开全部机关即可救出凤翕如，记住，不论死活，都绝不能让凤翕如落在宋人手里！", 0);
SetTask(4, 52);  
end;

function no()
Say("左护法端木睿：你身为本教掌旗使，连这点小事也做不了，如何服众？", 0);
end;




