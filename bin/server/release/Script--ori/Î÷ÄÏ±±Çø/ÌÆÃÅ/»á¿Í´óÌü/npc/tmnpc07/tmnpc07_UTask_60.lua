--description: 唐门唐仇 出师任务
--author: yuanlan	
--date: 2003/3/13



function tmnpc07_UTask_60()

Say("唐仇：你在本门学艺多时，为师要考一考你，东面竹林深处有一个<color=Red>竹丝洞<color>，如果你能够在<color=Red>竹丝洞<color>中取得一把<color=Red>七星绝命剑<color>，就可以顺利出师了。", 2, "接受考验/accept", "暂不接受/refuse");
DelItem("七星绝命剑")							--防止重接任务后，玩家捡起任务道具
end;


function accept()
SetTask(2, 62);
end;


function refuse()
end;




	


