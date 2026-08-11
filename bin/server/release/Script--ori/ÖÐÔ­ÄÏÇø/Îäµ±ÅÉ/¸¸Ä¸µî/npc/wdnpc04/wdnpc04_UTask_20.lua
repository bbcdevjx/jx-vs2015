--description: 武当派姚石门20级任务
--author: yuanlan	
--date: 2003/5/14



function wdnpc04_UTask_20()
Talk(2, "select", "姚石门：我自幼被师父收养，师父育我成人，教我武功，对我恩重如山。", "再过几日就是师父的八十华诞，我花了全部积蓄在襄阳城的杂货店里买了一件名贵的<color=Red>天蚕道袍<color>，原本打算送给师父，给他老人家一个惊喜，可是没想到竟把道袍给弄丢了。");
end;


function select()
Say("姚石门：我都快急死了！你能不能帮我一起找？", 2, "好的/yes", "我有别的事/no");
DelItem("补好的天蚕道袍")		--防止重接任务后，玩家捡起任务道具
end;

function yes()
Say("姚石门：太好了，谢谢你，我记得<color=Red>天蚕道袍<color>是在<color=Red>后山火狼洞<color>附近弄丢的。", 0);
SetTask(5, 22);	
end;

function no()
Say("姚石门：那我只有自己找了。", 0);
end;




