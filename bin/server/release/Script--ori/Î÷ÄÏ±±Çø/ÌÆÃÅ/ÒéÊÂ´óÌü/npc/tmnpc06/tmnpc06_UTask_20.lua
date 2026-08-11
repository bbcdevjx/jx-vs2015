--description: 唐门唐一尘 20级任务
--author: yuanlan	
--date: 2003/3/11



function tmnpc06_UTask_20()
Talk(2, "select", "唐一尘：我有一个姑母，叫做<color=Red>唐幽<color>，是我爹唯一的妹妹，当年因为违背门规，嫁给了外面的人，被祖父赶出家门，二十年不曾相见。我知道爹虽然口中不说，但是他十分想念这个妹妹。", "玩家：那掌门为什么不接她回唐门，一家人团圆呢？");
end;


function select()
Say("唐一尘：唐门家规甚严，爹也不敢违抗祖父当年的决定。你有什么办法让我爹和姑母兄妹团圆吗？", 2, "让我想想办法/accept", "没办法/refuse");
DelItem("金项圈")							--防止重接任务后，玩家捡起任务道具
end;


function accept()
Say("唐一尘：姑丈死后，姑母一直住在后山<color=Red>无心谷<color>的一间茅屋里，她从不见唐门中人，我去了好几次，都只能在<color=Red>门口<color>向她请安，这次就拜托你了！", 0);
SetTask(2, 22);
end;


function refuse()
end;



	


