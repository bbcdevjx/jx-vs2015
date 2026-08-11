--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\lib\\worldlibrary.lua");
BASE_EXP=2000000
FACTOR_EXP=1500000
LOAITRAICAY = {
	{14,"B¬"},
	{15, "Bßn bon"},
	{16, "B­ëi"},
	{17, "Ch«m ch«m"},
	{18, "Chuèi"},
	{19, "§µo"},
	{20, "D©u"},
	{21, "Khãm"},
	{22, "Dõa"},
	{23, "§u ®ñ "},
	{24, "KhÕ "},
	{25, "Lª "},
	{26, "MËn"},
	{27, "M¨ng côt"},
	{28, "M·ng cÇu"},
	{29, "Nh·n"},
	{30, "Cam"},
	{31, "T¸o"},
	{32, "V¶i"},
	{33, "Xoµi"},
};
function main(sel)
	local nTaskValue=GetTask(TASK_RESET4);
	if(SERVER_MODE == 1 or nTaskValue==999999999) then
	Talk(1,"",14661);
	return 1 end;
	Say(14661, 3,
	"Ta ®Õn giao Ýt tr¸i c©y/ok_giao",
	"PhÇn th­ëng nép nhiÒu/thuongnhieu",
	"Ta chØ ghÐ qua th«i/no");
end;

function ok_giao()
	GiveItemUI("Giao vËt phÈm","10 tr¸i mçi lo¹i, cµng nhiÒu phÇn th­ëng cµng lín","kiemtra");
end;

function kiemtra()
	local TIndex, TGenre,TDetail,_,_,_,_,TStackNum = 0;
	for i = 0,5 do
		for j = 0, 3 do
		TIndex, TGenre,TDetail,_,_,_,_,TStackNum = FindItemEx(14,i,j);
		if (TIndex > 0 and TGenre == 2 and TStackNum>=10) then
			for i=1,getn(LOAITRAICAY) do
				if(TDetail==LOAITRAICAY[i][1]) then
					break;
					end;
			end;
			if(GetBit(GetTask(TASK_RESET4),i)==0) then
			SetTask(TASK_RESET4,SetBit(GetTask(TASK_RESET4),i,1));
			RemoveItem(TIndex,10)
			AddOwnExp(BASE_EXP);
			Msg2Player(format("B¹n giao 10 %s nhËn ®­îc "..BASE_EXP.." ®iÓm kinh nghiÖm kh«ng céng dån",LOAITRAICAY[i][2]));
			end;
		end
		end
	end
	return 1;
end;

function thuongnhieu()
	local nTaskValue=GetTask(TASK_RESET4);
	if(nTaskValue==999999999) then
	return end;
	local nCount=0;
	for i=1,getn(LOAITRAICAY) do
		if(GetBit(GetTask(TASK_RESET4),i)==1) then
			nCount=nCount+1;
		end;
	end;
	if(nCount<2) then
	return end;
	local nAddExp=FACTOR_EXP*(nCount-1);
	AddOwnExp(nAddExp);
	Msg2Player("B¹n nhËn ®­îc "..nAddExp.." kinh nghiÖm kh«ng céng ®ån");
	SetTask(TASK_RESET4,999999999);
end;