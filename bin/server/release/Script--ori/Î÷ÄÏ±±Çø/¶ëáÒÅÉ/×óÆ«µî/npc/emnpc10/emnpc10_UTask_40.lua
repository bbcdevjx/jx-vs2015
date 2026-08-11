--description: 峨嵋派苏词馨40级任务
--author: yuanlan	
--date: 2003/3/5



function emnpc10_UTask_40()

Talk(3, "select", "苏词馨：在众多师姐妹中，我和秦师姐的感情最好，她快要过生日了，我想送她一份礼物。", "秦师姐精于音律，她一直想得到曲中极品——<color=Red>《百鸟朝凤》曲谱<color>，我四处寻访打听，得知<color=Red>青城山<color>中有一位隐居的<color=Red>高人<color>藏有这份曲谱，但是找了很久都没有找到他。", "秦师姐的生日就快到了，怎么办呢？")
DelItem("百鸟朝凤曲谱")						--防止重接任务后，玩家捡起任务道具
DelItem("芙蓉锦鸡图")						--防止重接任务后，玩家捡起任务道具
DelItem("灵麝香囊")						--防止重接任务后，玩家捡起任务道具
DelItem("鹰睛护身符")						--防止重接任务后，玩家捡起任务道具
DelItem("碧玺戒指") 						--防止重接任务后，玩家捡起任务道具

end;


function select()
Say("苏词馨：你愿意帮我去寻访那位高人吗？", 2, "愿意/accept", "没时间/refuse");
end;


function accept()
Say("苏词馨：太好了！那位<color=Red>高人<color>就隐居在<color=Red>青城山中部<color>的<color=Red>神仙洞<color>里。", 0);
SetTask(1, 42);
end;


function refuse()
end;


   








