--description: 秦陵农夫 非任务对话
--author: yuanlan	
--date: 2003/5/19


function trnpc06_Default()

UTask_tr = GetTask(4);

if (UTask_tr < 32) then								--尚未执行30级任务
Say("农夫：种了一辈子田，什么时候能挖个金矿发大财呢？", 0)
end;				

if (UTask_tr > 35) then								--执行完30级任务
Say("农夫：你还要石头吗？下次我再挖到的话，便宜点卖给你啰！", 0)
end;				

end;



