--description: 峨嵋派妙如非任务对话
--author: yuanlan	
--date: 2003/3/4


function emnpc08_Default()

UTask_em = GetTask(1);

if (UTask_em < 30) then   								--尚未完成20级任务
	if (UTask_em == 25) then   					
		Say("妙如：擒贼先擒王，你只要收伏了<color=Red>虎王<color>，其余的猛虎自然不敢为非作歹。虎性顽劣，你须得收服它<color=Red>三次<color>，它才会真正降服。", 0)
	else								
		Say("妙如：武学与佛理，同样需要参透，世上之事，只要用心，便能有所成就。", 0)
	end
else									
	if (UTask_em < 70) then   							--已经完成20级任务，尚未出师
		Say("妙如：你能够深入虎穴，收伏猛虎，真不愧为我峨嵋弟子。", 0)
	else										--已经出师
		Say("妙如：以你的慧根，将来必有一番成就，到时可别忘了我们这些师姐啊。", 0)
	end
end;	

end;




