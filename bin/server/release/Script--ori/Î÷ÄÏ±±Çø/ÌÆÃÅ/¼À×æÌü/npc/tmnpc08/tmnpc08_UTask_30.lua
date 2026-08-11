--description: 唐门唐不染 30级任务
--author: yuanlan	
--date: 2003/3/11



function tmnpc08_UTask_30()

Talk(3, "select", "唐不染：<color=Red>火器房<color>的<color=Red>唐云<color>师叔真可怜，两年前，一伙来历不明的人绑架了他的独生子小川，要挟他交出本门秘笈<color=Red>《火器谱》<color>。", "唐云师叔不敢违背门规，结果第二天那伙人就送来了小川的手臂，师叔只有这么一个儿子，肝胆俱裂之下不得已交出了《火器谱》。可是没想到换来的却是小川的尸首，师叔伤痛欲绝，发誓一定要手刃仇敌。", "但是由于唐云师叔泄漏了唐门秘笈，必须接受门规处罚，所以他终生不能再离开唐门半步，此仇此恨恐怕今生都报不了了！");

end;


function select()
Say("唐不染：唐云师叔曾经说过，不管是谁，只要能帮他报杀子之仇，夺回<color=Red>《火器谱》<color>，他会倾尽所有报答这个人。", 2, "寻找绑匪/accept", "不关我事/refuse");
DelItem("火器谱")							--防止重接任务后，玩家捡起任务道具
end;


function accept()
Say("唐不染：我已暗中探察过，那伙绑匪好像经常出没在<color=Red>青城山东边白云洞<color>一带。", 0);
SetTask(2, 32);
end;


function refuse()
end;



	


