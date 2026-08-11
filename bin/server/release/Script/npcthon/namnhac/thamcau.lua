Include("\\script\\lib\\worldlibrary.lua");
Include("\\script\\header\\taskid.lua");

function main(NpcIndex)
	if(GetTongFigure() == 3) then
		if(GetNumber(1,GetTongParam(),9)<1) then
		Talk(4,"sel_color","VÞ <sex> nµy xin dõng b­íc ®·. ","Huynh ®µi, cã chuyÖn g× cÇn chØ gi¸o? ","T¹i h¹ ThÈm C©u, hiÖn cã 1 con thiªn lÝ m· muèn b¸n, xem vÞ huynh ®µi nµy nhÊt ®Þnh lµ mét ®¹i t«ng s­ cña chÝnh ph¸i. Ngùa tèt cña t¹i h¹ thËt kh«ng xÊu hæ khi phôc vô anh hïng. ","§Ó ta xem thö ngùa quý cña huynh...")
		else
			Talk(1,"giaodich","Ng­¬i nhÊt ®Þnh ph¶i ®èi ®·i tèt víi ngùa, h»ng ngµy ph¶i t¾m cho nã, b¸nh ®Ëu ph¶i gi· bét cho nhuyÔn... ")
		end;
	else
		giaodich();
	end;
end;

function giaodich()
	Say(10062,2,
	"Mua ngùa/giaodich1",
	"Ta chØ ghÐ qua th«i/no")
end;

function sel_color()
	Say("<sex> h·y xem! ",6,
	"§©y kh«ng ph¶i lµ ¤ V©n §¹p TuyÕt sao!/buy_color",
	"§©y kh«ng ph¶i lµ XÝch Thè B¶o M· sao!/buy_color",
	"§©y kh«ng ph¶i lµ TuyÖt ¶nh sao!/buy_color",
	"§©y kh«ng ph¶i lµ §Ých L« sao!/buy_color",
	"§©y ch¼ng ph¶i lµ ChiÕu D¹ Ngäc S­ Tö sao!/buy_color",
	"§©y lµ ngùa g× vËy? T¹i h¹ hiÓu biÕt cßn kÐm/buy_none")
end

function buy_color(sel)
	local nSel =sel+1;
	Say("Kh«ng sai, <sex> qu¶ nhiªn biÕt nh×n! T¹i h¹ ®©y còng kh«ng muèn ph¶i b¸n nã, nh­ng hiÖn giê t¹i h¹ cÇn 300 v¹n l­îng b¹c! Hy väng <sex> ®èi ®·i tèt víi nã!",2,
	"Kh«ng sao ®©u, ta nhÊt ®Þnh sÏ ®èi xö tèt víi nã mµ/buy_yes("..nSel..")",
	"NhÊt thêi lµm sao t×m ra ®­îc sè tiÒn nµy/buy_no")
end;

function buy_none()
	Talk(1,"","NhÊt bang chi chñ, lµ mét nh©n vËt bËc thÇy lµm sao kh«ng biÕt ®©y rèt cuéc lµ ngùa g× chø? Thø lçi, xem ra t¹i h¹ ®· nh×n lÇm ng­êi!")
end

function buy_yes(nSel)
	if (GetCash() >= 3000000) then
		Pay(3000000)
		SetTongParam(SetNumber(1,GetTongParam(),9,1));
		AddItemID(AddItem(0,0,10,5,nSel,0,0,0))
		Talk(1,"","Ngùa ¬i ngùa! Tõ ®©y vÒ sau ng­¬i h·y ®i theo vÞ <sex> nµy nhÐ, nhÊt ®Þnh ph¶i ngoan ngo·n ®ã!")
	else
		Talk(1,"","Ta hiÖn giê trong ng­êi kh«ng mang theo ®ñ ng©n l­îng, huynh t¹m thêi cÇm ®ì sè tiÒn nµy vËy!")
	end
end

function buy_no()
	Talk(1,"","Kh«ng lÏ sè tiÒn nµy l¹i lµm khã <sex> sao")
end

function giaodich1()
	Sale(91)
end;


function no()
	--Talk(1,"",10064)
	Talk(1,"","Thiªn Lý m· kh«ng thiÕu, nh­ng ng­êi biÕt dïng ngùa hái cã mÊy ai!")
end;