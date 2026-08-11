--description: 天王帮水生非任务对话
--author: yuanlan	
--date: 2003/4/28


function twnpc07_Default()

i = random(0,1)						

if (i == 0) then 
Say("水生：我长大了以后也要像杨叔叔、王伯伯他们那样做人人敬重的大英雄！", 0)
return
end;

if (i == 1) then 
Say("水生：昨天我求杨叔叔教我功夫，可是他说我还小，我什么时候才能长大呢？", 0)
end;

end;



