--description: 天忍教小男孩20级任务
--author: yuanlan	
--date: 2003/5/18



function trnpc04_UTask_23()
Talk(2, "select", "玩家：小朋友，把日月双轮还给刚才那个大哥哥，好不好？", "小男孩：要我还日月双轮也行，不过要看你是不是比刚才那个笨蛋聪明一点。");
end;

function select()
Say("小男孩：这次我的问题是：一家有兄弟三个，其中只有一个喜欢说真话，大哥说二哥吹牛，二哥说小弟吹牛，而小弟听了后说大哥和二哥都吹牛，你知道这三人中，究竟谁说的是真话吗？", 3, "大哥/no", "二哥/yes", "小弟/no");
end;

function yes()
Say("小男孩：嗯……虽然你比他聪明一点，但是除非你帮我找回丢失的<color=Red>小黄狗<color>和<color=Red>小灰驴<color>，我才会把日月双轮还给你。", 0);
SetTask(4, 25);  
end;

function no()
Say("小男孩：原来你和他一样，也是一个大傻冒呀！", 0);
SetTask(4, 24);  
end;

