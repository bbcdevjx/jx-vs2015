--description: 峨嵋派高人40级任务
--author: yuanlan	
--date: 2003/3/5



function emnpc12_UTask_42()

Task0002 = GetTaskTemp(2)

if (Task0002 == 1) then						--已经打败怪物BOSS
	Say("高人：想要曲谱，拿徽宗名作<color=Red>《芙蓉锦鸡图》<color>来换，此画现落在<color=Red>成都府太平镖局<color>手里，有本事你就拿来。", 0)
	SetTask(1, 44)
else								--尚未打败怪物BOSS
	Say("高人：有什么事，先打败我养的<color=Red>灵兽<color>再说。", 0)
end;


end;


   








