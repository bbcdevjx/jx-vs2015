--description: 唐门唐闲 非任务对话
--author: yuanlan	
--date: 2003/3/12


function tmnpc12_Default()

UTask_tm = GetTask(2);

if (UTask_tm < 50) then								--尚未接到50级任务
Say("唐闲：天下的暗器功夫，如果老夫认了第二，没人敢认第一，你服不服气？", 0)
end;				

if (UTask_tm > 50) and (UTask_tm < 60) then					--尚未完成50级任务
Say("唐闲：秘笈被盗，非同小可，不仅老夫脱不了干系，还可能牵连许多无辜的人。", 0)
end;				

if (UTask_tm >= 60) and (UTask_tm < 70) then					--已经完成50级任务，尚未出师
Say("唐闲：幸亏你消解了这场弥天大祸，否则后果不堪设想！", 0)
end;				

if (UTask_tm >= 70) then							--已经出师
Say("唐闲：江湖上，明枪易躲，暗箭难防；你要切记：逢人且说三分话，未可全抛一片心。", 0)
end;				

end;


