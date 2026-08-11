--description: 唐门唐野 40级任务
--author: yuanlan	
--date: 2003/3/12



function tmnpc10_UTask_48()

Talk(4, "select2", "玩家：唐野师叔，你开的药方果然有效，耿前辈的女儿有救了！他已不再怪你。", "唐野：真的吗？太好了！不过他的女儿可不是我救的，而是你救的，你明白我的意思吗？", "玩家：明白！这事和师叔无关，是我做的！", "唐野：你果然机灵，老夫没看错你，哈哈哈哈！");

end;


function select2()
SetRank(29);
SetTask(2, 50);
AddMagic(54);
AddMagic(55);
--AddMagic(56);
Msg2Player("恭喜你！你已升为入阁弟子！");
Msg2Player("学会唐门武功“漫天花雨”。");
Msg2Player("学会唐门淬毒术。");
end;	


