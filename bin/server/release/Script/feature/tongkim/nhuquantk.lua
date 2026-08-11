--hoangnhk
TICHLUY = {
500,
1000,
2000,
5000
}
STRTABLE={
"Ta muèn mua ®¹o cô Tèng Kim/muadaocu",
"Ta muèn ®æi ®iÓm tÝch lòy Tèng Kim lÊy ®iÓm kinh nghiÖm/kn",
"Dïng Nh¹c V­¬ng hån th¹ch ®æi lÊy Nh¹c V­¬ng kiÕm/nvk",
"Xem ®iÓm tÝch lòy/tichluy",
"§Ó ta suy nghÜ l¹i/out"
}

function main(NpcIndex)
	local bTong = GetNpcValue(NpcIndex)
	if(bTong == nil) then
	return end
	local nSubWorldId = SubWorldID2Idx(380)
	if nSubWorldId < 0 then
	return end
	SubWorld = nSubWorldId;
	local nPlayerDataIdx, nGoup;
	if(bTong > 0) then	--ben Tong
	nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
		if(nPlayerDataIdx > 0) then	--neu da gia nhap roi
		nGroup = GetMSIdxGroup(1, nPlayerDataIdx)
		if(nGroup == 1) then	--nhom 1 da gia nhap phe Kim roi
			Talk(1,"",10659)
		return end
		end
	Say("LINK:<npc>",0,12103,5,
	STRTABLE
	)
	--ben kim
	else
	nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
		if(nPlayerDataIdx > 0) then	--neu da gia nhap roi
		nGroup = GetMSIdxGroup(1, nPlayerDataIdx)
		if(nGroup == 0) then	--nhom 0 da gia nhap phe Tong roi
			Talk(1,"",10634)
		return end
		end
	Say("LINK:<npc>",0,11317,5,
	STRTABLE
	)
	end
end;

function muadaocu()
	Sale(93,4)
end;

function kn()
	local strTab = {};
	local count = 0;
	for i=1,getn(TICHLUY) do
		strTab[i] = TICHLUY[i].." ®iÓm tÝch lòy/seltichluy";
		count = count + 1;
	end
		strTab[count+1] = "TÊt c¶ ®iÓm tÝch lòy/seltichluy";
		strTab[count+2] = "HiÖn t¹i kh«ng muèn ®æi/seltichluy";
	
	Say(12264,count+2,
	strTab)
end;

function seltichluy(sel)
	local nSel = sel+1;
	
	if(nSel == getn(TICHLUY)+2) then
	return end
	
	local nAccum = GetAccum();
	
	if(nSel == getn(TICHLUY)+1) then
		if nAccum <= 0 then
			Talk(1,"",12237)
		return end
		AddAccum(-nAccum)
		AddOwnExp(nAccum*100)
	return end
	
	if(TICHLUY[nSel] > nAccum) then
		Talk(1,"","§iÓm tÝch lòy hiÖn t¹i cña ng­¬i kh«ng ®ñ.")
	else
		AddAccum(-TICHLUY[nSel])
		AddOwnExp(TICHLUY[nSel]*100)
	end
	
end;

function nvk()
	Say("Ng­¬i thùc sù muèn ®æi lÊy Nh¹c V­¬ng kiÕm?",2,
	"Dïng 100 Nh¹c V­¬ng hån th¹ch ®Ó ®æi/doinvk",
	STRTABLE[5])
end;

function doinvk()
	if (GetItemCount(0,4,507) < 100) then
		Talk(1,"","Ng­¬i kh«ng cã ®ñ 100 Nh¹c V­¬ng hån th¹ch")
	return end
	if(CheckRoom(2,3) == 0) then
		Talk(1,"","Ng­¬i h·y ®Ó hµnh trang ®ñ chç trèng ®·!")
	return end
	AddItemID(AddItem(0,4,195,0,0,5,0,0))
	DelItem(100,0,4,507)
end;

function tichluy()
	local str = "Ng­¬i hiÖn cã <color=yellow>%d<color> ®iÓm tÝch lòy."
	Talk(1,"",format(str,GetAccum()))
end;

function out()
end;
