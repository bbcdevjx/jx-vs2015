--description: 武当派姚石门20级任务
--author: yuanlan	
--date: 2003/7/2



function wdnpc04_UTask_23()

if ( HaveItem("残破的天蚕道袍") == 1) then
	Talk(2, "", "姚石门：真糟糕，道袍给火狼咬破了，这可如何是好？", "玩家：这件道袍是在襄阳杂货店买的，我去<color=Red>襄阳<color>找<color=Red>杂货店老板<color>想想办法。")
	SetTask(5, 24)
else
	Say("系统：真糟糕！你不小心把残破的天蚕道袍给弄丢了，你打算怎么办？", 2, "我再找找/find", "重新去火狼洞打出道袍/redo")	
end

end;


function find()
end;

function redo()
Say("系统：请重新去火狼洞寻找道袍。", 0)
Msg2Player("你已选择重新去火狼洞寻找道袍。")
SetTask(5, 22)
end;




