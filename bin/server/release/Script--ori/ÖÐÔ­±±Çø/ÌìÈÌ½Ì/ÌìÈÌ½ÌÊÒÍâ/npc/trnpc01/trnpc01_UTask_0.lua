--description: 天忍教弟子入门任务
--author: yuanlan	
--date: 2003/5/17



function trnpc01_UTask_0()

Say("天忍死士：悉闻<color=Red>华山<color>上藏有一把<color=Red>禹王剑<color>，本教志在必得，谁能替本教夺得此剑，本教必有重谢！", 2, "愿去夺剑/yes1", "不感兴趣/no1")
DelItem("禹王剑")						--防止重接任务后，玩家捡起任务道具    	
		
end;


function yes1()
Say("天忍死士：此去华山路途遥远，路上凶险重重，你可以到<color=Red>汴京<color>坐马车去华山附近的<color=Red>凤翔<color>，也可以请本教的<color=Red>日月坛主乌合萨<color>护送你前往，不过你恐怕得花些银子才请得动他。", 0)
SetTask(4, 5)
end;


function no1()
Say("天忍死士：重赏之下必有勇夫，禹王剑本教志在必得。", 0)
end;
