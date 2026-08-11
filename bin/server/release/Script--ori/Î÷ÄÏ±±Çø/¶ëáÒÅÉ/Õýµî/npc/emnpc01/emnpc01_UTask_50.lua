--description: 峨嵋派清晓师太50级任务
--author: yuanlan	
--date: 2003/3/6



function emnpc01_UTask_50()

Say("清晓师太：为师与<color=Red>成都信相寺<color>的住持<color=Red>慈海大师<color>是方内知交，信相寺创建于隋炀帝大业年间，距今已五百五十五年。为了庆祝信相寺创寺的大好日子，为师准备送给信相寺一件佛门至宝<color=Red>《金线绣像金刚经》<color>作为贺礼。你愿意帮我去送这份贺礼吗？", 2, "愿意/accept", "恐难当此大任/refuse");
DelItem("金线绣像金刚经");						--防止重接任务后，玩家捡起任务道具

end;

function accept()
Say("清晓师太：<color=Red>慈海大师<color>闭关多年，寻常不见外客，你可以先去找他的师弟<color=Red>慈云法师<color>。", 1, "得到金刚经/get");
end;

function refuse()
Say("清晓师太：那为师另找他人吧。",0);
end;

function get()
AddEventItem("金线绣像金刚经");
Msg2Player("得到《金线绣像金刚经》。");
SetTask(1, 55);
end;


