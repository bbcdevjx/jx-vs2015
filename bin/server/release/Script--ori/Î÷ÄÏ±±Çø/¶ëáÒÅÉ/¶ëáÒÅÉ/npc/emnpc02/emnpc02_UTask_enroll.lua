--description: 峨嵋派叶冰痕入门任务
--author: yuanlan	
--date: 2003/3/3



function emnpc02_UTask_enroll()

Say("叶冰痕：峨眉山乃天地灵秀之地，庸俗之辈是无缘进峨嵋的。你上山是为了游玩，还是想拜师学艺？", 2, "拜师/yes", "游玩/no");

end;


function yes()

if (GetSeries() ~= 2) then								--如果玩家不属于水系
	Say("叶冰痕：本派武功以阴柔为主，你的根基不适合修练。", 0)
else
	if (GetFaction() ~= "") then							--如果玩家已经属于水系的某一门派
		Say("叶冰痕：你是云南翠烟门的人吗？本门乃是名门正派，旁门左道之人可不受欢迎。", 0)
	else	if ( GetSex() == 0 ) then     						--如果玩家性别为男
			Say("叶冰痕：本门只收女弟子。", 0)
		else
			Talk(4, "select", "叶冰痕：按照本派的规矩，凡是想拜入门墙需过<color=Red>四关<color>，我这里是<color=Red>第一关<color>。", "我爱喝茶，就先请你饮三杯茶，只要你能回答出三个关于茶的问题，就可以顺利过关。", "如果你答不出来，就请打消拜师的念头吧，我们峨嵋派可不收俗人。", "饮完第一杯茶。")
		end
	end				
end;	

end;


function no()
end;


function select()
Say("叶冰痕：第一杯是铁观音，你知道铁观音属于哪一种茶吗？", 3, "红茶/False1", "绿茶/False1", "乌龙茶/True1");
end;


function False1()
Say("叶冰痕：不对不对，再给你一次机会，好好想想。", 3, "红茶/False1", "绿茶/False1", "乌龙茶/True1");
end;


function True1()
Say("叶冰痕：不错，请喝第二杯茶：这杯是百花茶，用茉莉、玫瑰、蔷薇、秋菊、栀子、木犀等配和绿茶调置而成，集茶香与花香于一体。你知道它是用什么水冲泡的吗？", 3, "三月天的雨/False2", "深山里的泉/False2", "梅花上的雪/True2");
end;


function False2()
Say("叶冰痕：答错了，再试试。", 3, "三月天的雨/False2", "深山里的泉/False2", "梅花上的雪/True2");
end;


function True2()
Say("叶冰痕：看来你还有点灵性。最后一杯是猴魁茶，此茶生长在林壑幽深的峭壁上，人无法攀援采摘，只能依靠训练有素的猴子采摘，故名猴魁，十分稀有，乃是绿茶中的极品。你知道猴魁茶的产地是哪里吗？", 3, "徽州太平/True3", "洞庭君山/False3", "杭州西湖/False3");
end;


function False3()
Say("叶冰痕：你是不是记错了，再想想。", 3, "徽州太平/True3", "洞庭君山/False3", "杭州西湖/False3");
end;


function True3()
Say("叶冰痕：不错不错，你可以继续下面的考验了，下一位是<color=Red>秦倚风<color>师妹，她在<color=Red>迎客石<color>附近。", 0);
SetTask(1, 2);
end;