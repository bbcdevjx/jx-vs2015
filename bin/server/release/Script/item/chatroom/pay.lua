function main()
	Say("ThÎ cho phßng t¸n gÉu!", 3, 
	"T¹o phßng míi/tao_chatroom",
	"Gia h¹n phßng/giahan_chatroom",
	"KÕt thóc ®èi tho¹i/no");
end

function tao_chatroom()
	Msg2Player("Xin nhËp vµo tªn phßng");
	Input("nhapten"); 
end

function nhapten(name)
	SetTaskTemp(10,name);
	Msg2Player("Xin nhËp vµo mËt khÈu phßng");
	Input("nhapmatkhau",9999);
end;

function nhapmatkhau(pw)
	if(ChatRoom_Create(GetTaskTempS(10),pw,GetCurServerSec()+8*60*60)== 1)then
		DelItem(1,0,6,1063);
	end;
end;

function giahan_chatroom()
	Input("pay_chatroom_time"); 
end

function pay_chatroom_time(roomname)
	if (ChatRoom_AddTime(roomname,8*60*60) == 0) then
		Msg2Player("Phßng "..roomname.." kh«ng tån t¹i")
	else
		DelItem(1,0,6,1063);
		Msg2Player("Phßng "..roomname.." ®­îc gia h¹n thªm 8 tiÕng")
	end
end


function no()
end
