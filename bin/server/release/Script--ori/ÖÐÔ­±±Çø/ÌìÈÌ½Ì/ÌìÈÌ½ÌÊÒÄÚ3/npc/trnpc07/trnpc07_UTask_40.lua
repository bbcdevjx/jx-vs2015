--description: 天忍教右护法耶律辟离40级任务
--author: yuanlan	
--date: 2003/5/19



function trnpc07_UTask_40()
Say("右护法耶律辟离：据暗探来报，朝廷重臣太尉<color=Red>廖歧<color>原来竟是宋国的奸细，虽然他已经告老还乡，但是决不能让他活着离开金国，据可靠消息，<color=Red>廖歧<color>及其随从准备取道剑阁回四川，我派你即刻动身前去拦截他，一定要让<color=Red>剑阁蜀道<color>成为他的葬身之地！", 2, "属下遵命/yes", "属下恐难当此大任/no");
DelItem("天忍密信")						--处理重接任务后，玩家捡起任务道具的情况
end;


function yes()
Say("右护法耶律辟离：据报<color=Red>廖歧<color>等人已经到了<color=Red>剑阁蜀道<color>的<color=Red>锁云洞<color>，剑阁一带地形复杂，你可以花点钱让<color=Red>乌坛主<color>带你去, 速去速回！", 0);
SetTask(4, 42);  
end;

function no()
Say("右护法耶律辟离：这么点小事你都办不了，本教养你做什么！", 0);
end;




