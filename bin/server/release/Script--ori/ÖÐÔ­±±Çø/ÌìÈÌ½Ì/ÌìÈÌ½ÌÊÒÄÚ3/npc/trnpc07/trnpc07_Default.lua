--description: 天忍教右护法耶律辟离非任务对话
--author: yuanlan	
--date: 2003/5/19


function trnpc07_Default()

UTask_tr = GetTask(4);

if (UTask_tr < 10) then								--尚未入门
Say("右护法耶律辟离：你是什么人？难道是中原的奸细？", 0)
end;

if (UTask_tr >= 10) and (UTask_tr < 40) then					--尚未接40级任务
Say("右护法耶律辟离：养兵千日，用在一时，只要全心全意为本教效命，本教不会亏待你的！", 0)
end;				

if (UTask_tr > 40) and (UTask_tr < 45) then					--已经接到40级任务，尚未完成
Say("右护法耶律辟离：据报<color=Red>廖歧<color>等人已经到了<color=Red>剑阁蜀道<color>的<color=Red>锁云洞<color>，剑阁一带地形复杂，你可以花点钱让<color=Red>乌坛主<color>带你去, 速去速回！", 0)
end;				

if (UTask_tr >= 50) and (UTask_tr < 70) then					--已经完成40级任务，尚未出师
Say("右护法耶律辟离：背叛本教者，嘿嘿，我们会让他求生不能，求死不得！", 0)
end;				

if (UTask_tr >= 70) then							--已经出师
Say("右护法耶律辟离：想好了没有？是留在此地，还是南下中原？", 0)
end;				


end;



