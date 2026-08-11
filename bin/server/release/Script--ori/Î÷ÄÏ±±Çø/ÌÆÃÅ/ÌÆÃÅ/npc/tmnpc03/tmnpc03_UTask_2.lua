--description: 唐门普通弟子 竹海第二关 入门任务
--author: yuanlan	
--date: 2003/3/10



function tmnpc03_UTask_2()

if ( HaveItem("青色竹杖") == 1) then
	Say("唐门庄丁：九宫阵有九个格子，倘若每个格子填上适当的数字，就能够使填充后不论纵横斜角，每三个数字相加都是十五，你知道怎么填吗？第一行：", 3, "4、9、2/False1", "2、4、9/False1", "2、9、4/True1")
else
	Say("唐门庄丁：先找到<color=Red>青色竹杖<color>再来找我。", 0)
end;

end;

	
function False1()
Say("唐门庄丁：不对，这四周的<color=Red>大马猴、大野猴<color>可比你聪明啊，它们都知道呢！", 0);
end;


function True1()
Say("唐门庄丁：答对了，那第二行呢？", 3, "7、5、3/True2", "5、3、7/False2", "5、7、3/False2");
end;


function False2()
Say("唐门庄丁：不对，还是去问问这四周的<color=Red>大马猴、大野猴<color>吧！", 0);
end;


function True2()
Say("唐门庄丁：不错，那最后一行该怎么填：", 3, "6、8、1/False3", "8、1、6/False3", "6、1、8/True3");
end;	


function False3()
Say("唐门庄丁：不对，为什么不去问问这四周的<color=Red>大马猴、大野猴<color>呢？", 0);
end;


function True3()
Say("唐门庄丁：很好，你全都答对了。白色竹杖给你，可别弄丢了！去第三关找另一个庄丁拿<color=Red>紫色竹杖<color>吧。", 0);
AddEventItem("白色竹杖");
Msg2Player("得到白色竹杖。");
SetTask(2, 6);
end;	

	


