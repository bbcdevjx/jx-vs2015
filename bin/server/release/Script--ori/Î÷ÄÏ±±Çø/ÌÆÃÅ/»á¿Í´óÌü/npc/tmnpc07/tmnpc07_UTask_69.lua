--description: 唐门唐仇 出师任务
--author: yuanlan	
--date: 2003/6/17



function tmnpc07_UTask_69()

Talk(3, "select3", "唐仇：我要的七星绝命剑呢？", "……", "唐仇：你如此经不起金银财宝的诱惑，我怎么放心让你出师呢？说不定有一天你会为了更大的利益，而背叛本门！")
	
end;


function select3()
Say("掌门大怒，你应该怎么做呢？", 2, "钱已到手也不亏/a", "恳请掌门原谅/b")
end;


function a()
Say("唐仇：哼！像你这样的人，永远也别想出师了！", 0)
if (GetCash() >= 10000) then
	Pay(10000)
else
	Pay(GetCash())	
end
end;
	
	
function b()
Say("唐仇：看你诚心悔过，我就再给你一次机会，你必须再闯一次竹丝洞，取回七星绝命剑。", 0)
if (GetCash() >= 10000) then
	Pay(10000)
else
	Pay(GetCash())	
end
SetTask(2, 62)
end;


