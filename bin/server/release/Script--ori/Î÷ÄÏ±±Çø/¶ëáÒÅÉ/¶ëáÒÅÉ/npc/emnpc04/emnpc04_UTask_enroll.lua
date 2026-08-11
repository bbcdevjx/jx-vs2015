--description: 峨嵋派何怜飘入门任务
--author: yuanlan	
--date: 2003/3/3



function emnpc04_UTask_enroll()

Say("何怜飘：你能连过两关，看来还有些本事，不过，我这里有三副对子只有上联，如果你能全部对出下联，我才服气。第一副上联是：一弹流水再弹月", 3, "半入江风半入云/True7", "一寸相思一寸灰/False7", "半壕春水一城花/False7");

end;


function False7()
Say("何怜飘：对不出来吗？", 3, "半入江风半入云/True7", "一寸相思一寸灰/False7", "半壕春水一城花/False7");
end;


function True7()
Say("何怜飘：对得好。第二联：侧身天地更怀古", 3, "万里悲秋常作客/False8", "独立苍茫自咏诗/True8", "空令岁月易蹉跎/False8");
end;


function False8()
Say("何怜飘：认输了吧？", 3, "万里悲秋常作客/False8", "独立苍茫自咏诗/True8", "空令岁月易蹉跎/False8");
end;


function True8()
Say("何怜飘：好一个'独立苍茫自咏诗'！不错不错。第三联：一明分日月", 3, "思耕心上田/False9", "闲看门中木/False9", "五岳各丘山/True9");
end;


function False9()
Say("何怜飘：再想想，可不要功亏一篑喔！", 3, "思耕心上田/False9", "闲看门中木/False9", "五岳各丘山/True9");
end;


function True9()
Say("何怜飘：恭喜你！你已经顺利过了三关考验，现在你去找<color=Red>谢云萝<color>师妹吧，她就在半山腰的<color=Red>钻天坡入口<color>。", 0);
SetTask(1, 6);
end;