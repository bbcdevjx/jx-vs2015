--description: 武当派小道士清风非任务对话
--author: yuanlan	
--date: 2003/5/14


function wdnpc01_Default()

UTask_wd = GetTask(5);

if (UTask_wd == 9) then 					--选择不入门
Say("小道士清风：武当山北通秦岭，南接巴山，连绵起伏，纵横百里，七十二峰，山势各异，雄奇俊伟，每年来这里游玩的人可多啦！本山供奉的是道家最高尊神真武大帝，“非真武不足以当此山”，因此叫做武当山。", 0)
return
end;

if (UTask_wd < 10) then 					--尚未入门
	Say("小道士清风：我的<color=Red>木桶<color>掉进了<color=Red>井<color>里，如果找不回<color=Red>木桶<color>，打不了水，回去一定会被师兄责骂的。", 0)
else
	if (UTask_wd < 70) then   				--已经入门，尚未出师
		Say("小道士清风：天天都要我在这里打水，还说是修行，真是没劲透了，你有空就来陪我说说话，好吗？", 0)
	else							--已经出师
		Say("小道士清风：你真有本事！唉，我什么时候才能出师呢？", 0)
	end
end;	

end;



