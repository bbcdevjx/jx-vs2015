--description: 天忍教教主完颜宏烈非任务对话
--author: yuanlan	
--date: 2003/5/19


function trnpc09_Default()

UTask_tr = GetTask(4);

if (UTask_tr < 10) then								--尚未入门
Say("教主完颜宏烈：只要是青年才俊想加入本教，本教都十分欢迎。", 0)
end;

if (UTask_tr >= 10) and (UTask_tr < 60) then								--尚未接出师任务
Say("教主完颜宏烈：自古以来，位高权重者多为人主所忌，当今圣上虽然对老夫恩宠有加，但是猜忌之心恐怕从未消失过，否则又怎会把七公主派到教中做一个小小的堂主呢？唉！罢！罢！罢！老夫只求无愧于天地良心，管不了那许多谗言的诽谤诋毁！", 0)
end;				

if (UTask_tr > 60) and (UTask_tr < 65) then					--已经接到出师任务，尚未拿到五把断剑
Say("教主完颜宏烈：在进入<color=Red>圣洞<color>取回<color=Red>羊皮书<color>之前，你必须先找到流落在<color=Red>汴京<color>城里的<color=Red>五把断剑<color>。", 0)
end;				

if (UTask_tr >= 65) and (UTask_tr < 68) then					--已经接到出师任务，尚未拿到羊皮书
Say("教主完颜宏烈：<color=Red>羊皮书<color>就在后面的<color=Red>圣洞<color>里。", 0)
end;				

if (UTask_tr >= 70) then							--已经出师
Say("教主完颜宏烈：到底是后生可畏啊！以你目前的武功和胆识，假以时日，必会有一番惊天动地的大作为！希望日后你我不会成为敌人！", 0)
end;				


end;