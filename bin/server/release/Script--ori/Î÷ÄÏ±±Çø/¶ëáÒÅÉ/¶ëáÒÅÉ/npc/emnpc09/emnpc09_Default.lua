--description: 峨嵋派穆云慈非任务对话
--author: yuanlan	
--date: 2003/3/5


function emnpc09_Default()

UTask_em = GetTask(1);

if (UTask_em < 40) then   								--尚未完成30级任务
	if (UTask_em == 35) then   							--已接到任务			
		Say("穆云慈：麻烦你到<color=Red>后山湖边<color>找找看。<color=Red>火狐<color>最爱吃<color=Red>鸡腿<color>，你得用鸡腿引它回来，否则它不会和陌生人走的。", 0)
	else										--未接到任务
		Say("穆云慈：火狐呀火狐，你跑到哪里去了？快点出来吧！", 0)
	end
else									
	if (UTask_em < 70) then   							--已经完成30级任务，尚未出师
		Say("穆云慈：小师妹，谢谢你帮我找回火狐！", 0)
	else										--已经出师
		Say("穆云慈：小师妹，你要下山了吗？我和火狐都会想你的。", 0)
	end
end;	

end;




