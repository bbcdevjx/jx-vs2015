
Include("\\script\\lib\\thuvien.lua")
Include("\\script\\monphai.lua") 

 
function main()
Say("<color=green>Hç Trî T©n Thñ <color>: Trong thêi gian §ua Top sÏ kh«ng hç trî bÊt kú tr­êng hîp nµo? :" ,7,
"NhËn hç trî T©n Thñ /nhanhotrotanthu",  
"NhËn Kinh NghiÖm/nhanlv10",
"NhËn §å Test/nhantbxanh1",
"§æi Mµu LuyÖn C«ng/doimau",
"NhËn Skill /skillxxx",
"LËp bang héi/bangs",
"Tho¸t./no")
end

function bangs()
AddEventItem(164)
AddRepute(2000)
end
function dangkydoiten()
if ten ~= GetName() then
taikhoan = ""
nhanvat = ""
ten = GetName()
end
Say("<color=green>Hç Trî T©n Thñ <color> Tµi kho¶n míi: <color=yellow>"..taikhoan.."<color>, Nh©n vËt míi: <color=yellow>"..nhanvat.." ",5,
"§iÒn tµi kho¶n míi/dientk",
"§iÒn tªn nh©n vËt míi/dientennv",
"X¸c nhËn ®¨ng ký ®æi tªn nh©n vËt /xacnhandk",
"H­íng dÉn ®æi tªn ®Ó tr¸nh sai lÇm /hddoiten",
"Tho¸t./no")
end

function hddoiten()
Talk(2,"","B­íc 1: B¹n h·y t¹o 1 tµi kho¶n míi, sè ®iÖn tho¹i ®¨ng ký trïng víi tµi kho¶n hiÖn t¹i. Sau ®ã t¹o 1 nh©n vËt míi ®Ó ®¶m b¶o kh«ng bÞ trïng","B­íc 2: B¹n ®iÒn th«ng tin tµi kho¶n, tªn nh©n vËt võa t¹o vµo , cÇn 200 vµng ®Ó x¸c nhËn")
end
function dientk()
OpenStringBox(1,"NhËp tµi kho¶n","xnnhaptk")
end

function xnnhaptk(name)
taikhoan = name
Talk(1,"","Tµi kho¶n míi ®· ®iÒn: <color=yellow>"..taikhoan.."")
end

function dientennv()
OpenStringBox(1,"Tªn Nh©n vËt","xnnhapnv")
end
function xnnhapnv(name2)
nhanvat = name2
Talk(1,"","Tªn nh©n vËt míi ®· ®iÒn: <color=yellow>"..nhanvat.."")
end

function xacnhandk()
Say("B¹n cã ch¾c ch¾n muèn ®æi tªn nh©n vËt thµnh <color=yellow>"..nhanvat.."<color> thuéc tµi kho¶n <color=yellow>"..taikhoan.."<color> kh«ng ?",2,
"Ta ch¾c ch¾n/xndk",
"Ta xin nhËp l¹i th«ng tin/no")
end

function xndk()
if taikhoan == "" or nhanvat == "" then
Talk(1,"","Tµi kho¶n hoÆc tªn nh©n vËt kh«ng ®­îc ®Ó trèng !")
return
end
if GetTask(99) < 200 then
Talk(1,"","B¹n kh«ng ®ñ 200 vµng, kh«ng thÓ thùc hiÖn d¨ng ký !")
return
end
vang = GetTask(99)
vang1 = GetTask(101)
if GetTask(99) >= 200 and GetTask(101) >= 200 then
SetTask(99,GetTask(99) - 200)
SetTask(101,GetTask(101) - 200)
if GetTask(99) == vang-200 and GetTask(101) == vang1-200 then
inlogini("["..GetAccount().."] - ["..GetName().."] doi thanh ["..taikhoan.."] - ["..nhanvat.."] - "..GetLevel().." - "..GetFaction().." ")
Talk(1,"","B¹n ®· ®¨ng ký ®æi tªn nh©n vËt thµnh c«ng, chóng t«i sÏ kiÓm tra vµ gi¶i quyÕt theo thø tù ®¨ng ký ")
Msg2Player("B¹n ®· ®¨ng ký ®æi tªn nh©n vËt thµnh c«ng ")
Msg2Player("Tµi kho¶n cò: ["..GetAccount().."] --> Tµi kho¶n míi: <color=yellow>["..taikhoan.."] ")
Msg2Player("Tªn nh©n vËt cò: ["..GetName().."] --> Tªn nh©n vËt míi: <color=yellow>["..nhanvat.."] ")
Msg2Player("Khi tµi kho¶n cò bÞ khãa, b¹n vui lßng ®¨ng nhËp b»ng tµi kho¶n míi, kh«ng thÓ sö dông n÷a !")
Msg2SubWorld("<color=pink>§¨ng ký ®æi tªn thµnh c«ng: ["..GetName().."]  - §¼ng cÊp: "..GetLevel().." - M«n Ph¸i: "..GetFaction().." ")
else
inlogini("Error: "..GetAccount().." - "..GetName().." reset "..GetTask(99).." vang")
SetTask(99,0)
SetTask(101,0)
Talk(1,"","Check hack KNB: Ban lien he GM de duoc giai quyet ")

end
else
Talk(1,"","B¹n kh«ng ®ñ 200 vµng, kh«ng thÓ thùc hiÖn d¨ng ký !")
end
end
function inlogini(string)
thoigian = tonumber(date("%H%M%d%m"))
LoginLog = openfile("Data/logDangKyDoiTen.txt", "a");
if LoginLog then
write(LoginLog,""..string.." - Time: "..thoigian.."\n");
end
closefile(LoginLog)
end


function skillxxx()
nhanpt2()
nhankynang12()
end
function nhanpt2()
if GetFaction() == "" then
Talk(1,"","B¹n ch­a gia nhËp ph¸i, kh«ng thÓ nhËn phÇn th­ëng")
return
end

if GetLevel() < 80 then
Talk(1,"","B¹n kh«ng ®ñ ®¼ng cÊp 80, kh«ng thÓ nhËn phÇn th­ëng !")
return
end


		if GetLevel() >= 80 then
			if mp() == 1 then
				AddMagic(350,20)
				AddMagic(351,20)
				AddMagic(353,20)
			elseif mp() == 2 then
				AddMagic(342,20)
				AddMagic(347,20)
				AddMagic(345,20)
			elseif mp() == 3 then
				AddMagic(355,20)
				AddMagic(358,20)
				AddMagic(302,20)
				AddMagic(399,0)
			elseif mp() == 4 then
				AddMagic(359,20)
				AddMagic(361,20)
				AddMagic(327)
			elseif mp() == 5 then
				AddMagic(374,20)
				AddMagic(370,20)
				AddMagic(291)
			elseif mp() == 6 then
				AddMagic(377,20)
				AddMagic(378,20)
			elseif mp() == 7 then
				AddMagic(362,20)
				AddMagic(389,20)
			elseif mp() == 8 then
				AddMagic(365,20)
				AddMagic(367,20)
				AddMagic(328)
			elseif mp() == 9 then
				AddMagic(380,20)
				AddMagic(382,20)
			elseif mp() == 10 then
				AddMagic(385,20)
				AddMagic(384,20)
				AddMagic(329)
			else
				Talk(1,"","Ban chua gia nhap phai")
			end
			Msg2Player("B¹n nhËn ®­îc Full Kü N¨ng 90 cña ph¸i !")
		else
			Talk(1,"","B¹n kh«ng ®ñ ®¼ng cÊp 90 !")
		end
			Talk(0,"")
end

function nhankynang12()
if GetLevel() >= 120 then
	if mp() == 1 then
		AddMagic(412,20)
		elseif mp() == 2 then
		AddMagic(414,20)
		elseif mp() == 3 then
		AddMagic(416,20)
		elseif mp() == 4 then
		AddMagic(418,20)
		elseif mp() == 5 then
		AddMagic(420,20)
		elseif mp() == 6 then
		AddMagic(422,20)
		elseif mp() == 7 then
		AddMagic(424,20)
		elseif mp() == 8 then
		AddMagic(426,20)
		elseif mp() == 9 then
		AddMagic(428,20)
		elseif mp() == 10 then
		AddMagic(430,20)
		else
		Msg2Player("B¹n ch­a gia nhËp m«n ph¸i nµo !")
		
		end		
else
Msg2Player("§¼ng cÊp yªu cÇu: 120")
end
end




function doiph()
Say("<color=green>Hç Trî T©n Thñ  <color>: Chµo §¹i hiÖp <color=red>"..GetName().."<color>. B¹n chän lo¹i nµo ?",4,
"Phóc duyªn tiÓu/doiph2",
"Phóc duyªn trung/doiph2",
"Phóc duyªn ®¹i/doiph2",
"Tho¸t./no")
end

function doiph2(nsel)
i = nsel+1
sl = GetTask(162)
if i == 1 then
if GetTask(162) >= 12 then
SetTask(162,GetTask(162)-12)
if GetTask(162) == (sl-12) then
AddEventItem(173)
Msg2Player("B¹n nhËn ®­îc 1 b×nh Phóc Duyªn tiÓu")
Talk(0,"")
else
Talk(1,"","Hack ha em")
end
else
Talk(1,"","<color=green>Hç Trî T©n Thñ  <color>: B¹n kh«ng ®ñ 12 ®iÓm phóc duyªn !")
end
elseif i == 2 then
if GetTask(162) >= 24 then
SetTask(162,GetTask(162)-24)
if GetTask(162) == (sl-24) then
AddEventItem(174)
Msg2Player("B¹n nhËn ®­îc 1 b×nh Phóc Duyªn trung")
Talk(0,"")
else
Talk(1,"","Hack ha em")
end
else
Talk(1,"","<color=green>Hç Trî T©n Thñ  <color>: B¹n kh«ng ®ñ 24 ®iÓm phóc duyªn !")
end
elseif i == 3 then
if GetTask(162) >= 60 then
SetTask(162,GetTask(162)-60)
if GetTask(162) == (sl-60) then
AddEventItem(175)
Msg2Player("B¹n nhËn ®­îc 1 b×nh Phóc Duyªn ®¹i")
Talk(0,"")
else
Talk(1,"","Hack ha em")
end
else
Talk(1,"","<color=green>Hç Trî T©n Thñ  <color>: B¹n kh«ng ®ñ 60 ®iÓm phóc duyªn !")
end
end
end

function CheckTonTai(ten)
for i=1,getn(DS120) do
	if DS120[i][2] == GetName() then
		return 1
	end
end
return 0
end
function CheckTonTai2(ten)
for i=1,getn(DS135) do
	if DS135[i][2] == GetName() then
		return 1
	end
end
return 0
end

function nhanpt3()
if getn(DS120) > 0 then
	if CheckTonTai(GetName()) == 1 then
		Talk(1,"","B¹n ®· nhËn phÇn th­ëng nµy råi !")
		return
	end
end

if GetTask(115) ~= 10000 then
Talk(1,"","B¹n kh«ng thuéc nh÷ng nhËn vËt §ua Top, kh«ng thÓ nhËn th­ëng !")
return
end
if GetLevel() < 120 then
Talk(1,"","B¹n kh«ng ®ñ ®¼ng cÊp 120, kh«ng thÓ nhËn th­ëng ")
return
end

if CheckFreeBoxItem(0,10,5,1) == 0 then
Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng !")
return
end

if getn(DS120) < 100 then
	DS120[getn(DS120)+1] = {GetAccount(),GetName(),GetLevel()}
	BANG = TaoBang(DS120,"DS120")
				
	LuuBang("script/danhsach120.lua",BANG)

	AddItem(0,10,5,random(1,4),0,0,0)

	Msg2SubWorld("Chóc mõng ®¹i hiÖp ["..GetName().."] ®· <color=yellow>1 Thó C­ìi 8x<color=red> tõ phÇn th­ëng mèc 120")
	Msg2SubWorld("Sè l­îng giíi h¹n: <color=pink>"..getn(DS120).." / 100 con !")

else
Talk(1,"","HiÖn t¹i ®· ®ñ 100 ng­êi ®¹t Level 120 ®Çu tiªn !")
end
end



function nhanpt4()
if getn(DS135) > 0 then
	if CheckTonTai2(GetName()) == 1 then
		Talk(1,"","B¹n ®· nhËn phÇn th­ëng nµy råi !")
		return
	end
end

if GetTask(115) ~= 10000 then
Talk(1,"","B¹n kh«ng thuéc nh÷ng nhËn vËt §ua Top, kh«ng thÓ nhËn th­ëng !")
return
end
if GetLevel() < 135 then
Talk(1,"","B¹n kh«ng ®ñ ®¼ng cÊp 135, kh«ng thÓ nhËn th­ëng ")
return
end

if getn(DS135) < 20 then
	DS135[getn(DS135)+1] = {GetAccount(),GetName(),GetLevel()}
	BANG = TaoBang(DS135,"DS135")
				
	LuuBang("script/danhsach135.lua",BANG)

	AddEventItem(19)

	Msg2SubWorld("Chóc mõng ®¹i hiÖp ["..GetName().."] ®· <color=yellow>BÝ KÝp 120<color=red> tõ phÇn th­ëng mèc 135")
	Msg2SubWorld("Sè l­îng giíi h¹n: <color=pink>"..getn(DS135).." / 20 con !")

else
Talk(1,"","HiÖn t¹i ®· ®ñ 20 ng­êi ®¹t Level 135 ®Çu tiªn !")
end
end

function aaa()
Talk(1,"","§ang Update !")
end

function nhanhotrotanthu()
if GetLevel() == 1 then
	for k=1,9 do AddOwnExp(200000000) end
	a= AddItem(0,6,2,1,0,0,0)
	SetTimeItem(a,550324);
	b= AddItem(0,5,4,1,0,0,0)
	SetTimeItem(b,550324);
	c= AddItem(0,9,2,1,0,0,0)
	SetTimeItem(c,550324);
	d= AddItem(0,7,14,1,0,0,0)
	SetTimeItem(d,550324);
	e= AddItem(0,2,29,1,0,0,0)
	SetTimeItem(e,550324);
	f= AddItem(0,8,2,1,0,0,0)
	SetTimeItem(f,550324);
	g= AddItem(0,4,2,1,0,0,0)
	SetTimeItem(g,550324);
	h= AddItem(0,3,1,1,0,0,0)
	SetTimeItem(h,550324);
	j = AddItem(0,3,2,1,0,0,0)
	SetTimeItem(j,550324);
	ngua = AddItem(0,10,2,10,0,0,0)
	SetTimeItem(ngua,550324);
	Msg2SubWorld("Chµo mõng t©n thñ míi : <color=pink>"..GetName().." ")
	KickOutSelf()
else
	Talk(1,"","Nh©n vËt Level 1 m¬i nhËn hç trî ®­îc !")
end

end

function main1()
w,x,y = GetWorldPos()
if w == 4 then
Say("<color=green>Hç Trî T©n Thñ <color>: Trong thêi gian §ua Top sÏ kh«ng hç trî bÊt kú tr­êng hîp nµo? :" ,7,
"§æi mµu luyÖn c«ng/doimau",
"NhËn PhÇn Th­ëng Mèc 60 /nhanpt1", 
"NhËn PhÇn Th­ëng Mèc 110 /nhanpt2", 
"NhËn PhÇn Th­ëng Mèc 120 /nhanpt3", 
"NhËn PhÇn Th­ëng Mèc 135 /nhanpt4", 
"TÈy Tñy MiÔn PhÝ /taytuy",
"Thoat./no")
else
Say("<color=green>Hç Trî T©n Thñ <color>: Trong thêi gian §ua Top sÏ kh«ng hç trî bÊt kú tr­êng hîp nµo? :" ,2,
"§æi mµu luyÖn c«ng/doimau",
"Thoat./no")

end
end

function taytuy()
Say("<color=green>Hç Trî T©n Thñ <color>: B¹n sÏ ®­îc TÈy Kü N¨ng vµ TÈy TiÒm N¨ng, tuy nhiªn sau nµy sÏ kh«ng ®­îc lªn ®¶o tÈy tñy miÔn phÝ n÷a. B¹n cã ch¾c ch¾n kh«ng ?",2,
"Ta muèn tÈy tñy /taytuy2",
"Thoat./no")
end

function TayTiemNang()
a = GetSeries()
if a == 0 then
RestAP(35,25,25,15)
elseif a == 1 then
RestAP(20,35,20,25)
elseif a == 2 then
RestAP(25,25,25,25)
elseif a == 3 then
RestAP(30,20,30,20)
elseif a == 4 then
RestAP(20,15,25,40)
end
diemtn = GetProp()
AddProp(-diemtn)
diem = (GetLevel()-1)*5+GetTask(198)*5 + getTiemNang()
AddProp(diem)
KickOutSelf()
end


function TayKyNang()
diemkn = GetMagicPoint()
AddMagicPoint(-diemkn)
diemkn2 = (GetLevel()-1)+GetTask(199) + getKyNang()
AddMagicPoint(diemkn2)
RollbackSkill()
UpdateSkill()
KickOutSelf()
end
function getTiemNang()
if GetTask(139) == 1 then
return 50
elseif GetTask(139) == 2 then
return 100
elseif GetTask(139) == 3 then
return 200
elseif GetTask(139) == 4 then
return 300
elseif GetTask(139) == 5 then
return 400
else
return 0
end
end
function getKyNang()
if GetTask(139) == 1 then
return 10
elseif GetTask(139) == 2 then
return 20
elseif GetTask(139) == 3 then
return 40
elseif GetTask(139) == 4 then
return 60
elseif GetTask(139) == 5 then
return 80
else
return 0
end
end



function taytuy2()
if GetTask(196) == 0 then
	SetTask(196,2)
	TayTiemNang()
	TayKyNang()
else
	Talk(1,"","B¹n ®· sö dông tÈy tñy råi !")
end
end


function nhanpt1()
if GetLevel() >= 60 then
	if GetTask(132) == 0 then
		SetTask(132,1)
AddItem(0,6,2,1,0,0,0)
AddItem(0,5,4,1,0,0,0)
AddItem(0,9,2,1,0,0,0)
AddItem(0,7,14,1,0,0,0)
AddItem(0,2,29,1,0,0,0)
AddItem(0,8,2,1,0,0,0)
AddItem(0,4,2,1,0,0,0)
AddItem(0,3,1,1,0,0,0)
AddItem(0,3,2,1,0,0,0)
		
		Msg2Player("B¹n nhËn ®­îc 1 Set Kim Phong !")
	else
		Talk(1,"","B¹n ®· nhËn phÇn th­ëng nµy råi !")
	end
else
	Talk(1,"","B¹n ch­a ®ñ ®¼ng cÊp 60, kh«ng thÓ nhËn phÇn th­ëng !")
end
end
 
function doimau()
if GetTeamSize() > 0 then
LeaveTeam();
end

if GetFaction() == "" and GetCurCamp() > 0 then
SetCurCamp(0)
SetCamp(0)
return
end

if GetCurCamp() == 0 and GetFaction() == "" then
Talk(1,"","B¹n ch­a gia nhËp ph¸i")
return
end

if GetTongNameID() == 0 then
Say("<color=green>Vui lßng chän mµu:",5,
"ChÝnh Ph¸i/doimau11",
"Tµ Ph¸i/doimau11",
"Trung LËp /doimau11",
"S¸t Thñ/doimau11",
"Tho¸t./no")
else
Talk(1,"","V« bang kh«ng ®æi mµu ®­îc !")
end
end

function doimau11(nsel)
if GetCash() >= 2000 then
Pay(2000)
SetCamp(nsel+1)
SetCurCamp(nsel+1)
else
Talk(1,"","<color=green>Hç trî t©n thñ: <color>Kh«ng ®ñ 2000 l­îng")
end
end

function nhantt()
for i=28,30 do AddEventItem(i) end
for k=1,6 do AddEventItem(31) end
end

function nhantbxanh()
Talk(1,"","Vui lßng nhÊn vµo s¸ch t©n thñ ®Ó nhËn trang bÞ !")
end

function shop()
Sale(1)
end

function full()
AddItem(0,10,5,random(1,5),0,0,0)
end
function nhantien()
Pay(GetCash())
Earn(10000000)
end
function nhantbxanh1()
Say("Chon Loai Trang Bi: ",10,
"Vò khÝ/tbxanh1", 
"Ao /tbxanh1",
"NhÉn /tbxanh1",
"D©y ChuyÒn /tbxanh1",
"Giµy /tbxanh1",
"Th¾t l­ng /tbxanh1",
"Nãn /tbxanh1",
"Bao Tay/tbxanh1",
"Ngäc Béi/tbxanh1",
"Tho¸t/no")
end


function tbxanh1(nsel)
SetTaskTemp(1,nsel)
Say("Chon Ngò hµnh ",6,
"Kim/tbxanh2",
"Méc /tbxanh2",
"Thñy/tbxanh2",
"Háa /tbxanh2",
"Thæ /tbxanh2",
"Thoat./no")
end
 
function tbxanh2(nsel)
id = 0
sex=1
if GetSex()==1 then
sex=0
end
i = GetTaskTemp(1)
i=i+1
if i == 0 then
id = random(0,5)
elseif i == 1 then
vukhi(nsel)
return
elseif i == 2 then
id = random(0,28)
elseif i == 3 then
id = 0
elseif i == 4 then
id = sex
elseif i == 5 then
if sex==1 then
id = 1
else
id=2
end
elseif i == 6 then
id = sex
elseif i == 7 then
if sex==1 then
id = 2
else
id= 9
end
elseif i == 8 then
id = sex
elseif i == 9 then
id = sex
end
for k=1,5 do
AddItem(0,i,id,level(),nsel,0,10)
end
end

function vukhi(nsel)
	local TAB_DOXANH = {
		"LÊy KiÕm/laydoxanh",
		"LÊy §ao/laydoxanh",
		"LÊy Bæng/laydoxanh",
		"LÊy Th­¬ng/laydoxanh",
		"LÊy Chïy/laydoxanh",
		"LÊy Song §ao/laydoxanh",
		"LÊy Phi Tiªu/laydoxanh",
		"LÊy Phi §ao/laydoxanh",
		"LÊy Tô TiÓn/laydoxanh",
		"KÕt thóc ®æi tho¹i/no",}
SetTask(211,nsel)
	Say("Chän b¹n cÇn dïng!!!",11,TAB_DOXANH[1],TAB_DOXANH[2],TAB_DOXANH[3],TAB_DOXANH[4],TAB_DOXANH[5],TAB_DOXANH[6],TAB_DOXANH[7],TAB_DOXANH[8],TAB_DOXANH[9],TAB_DOXANH[10])
end
function laydoxanh(sel)
	local aHeo = sel
	local aHeo1 = sel - 6
	local eHeo = GetTask(211)
	if (aHeo < 6) then
	for i=1,30 do AddItem(0,0,aHeo,10,eHeo,100,10) end
	else
	for i=1,30 do AddItem(0,1,aHeo1,10,eHeo,100,10) end
	end
end
function level()
if GetLevel() < 10 then
return 1
elseif GetLevel() >= 10 and GetLevel() < 19 then
return 2
elseif GetLevel() >= 20 and GetLevel() < 29 then
return 3
elseif GetLevel() >= 30 and GetLevel() < 39 then
return 4
elseif GetLevel() >= 40 and GetLevel() < 49 then
return 5
elseif GetLevel() >= 50 and GetLevel() < 59 then
return 6
elseif GetLevel() >= 60 and GetLevel() < 69 then
return 7
elseif GetLevel() >= 70 and GetLevel() < 79 then
return 8
elseif GetLevel() >= 80 and GetLevel() < 89 then
return 9
else
return 10
end
end



function nhanlv10()
if GetLevel()<150 then
for i=1,10 do
AddOwnExp(200000000)
Msg2Player("B¹n võa ®­îc t¨ng 10 Level !")
end
else
	Msg2Player("ChØ hç trî tèi ®a 150 cÊp ®Ó test!")
end
end
function nhanlv()
AddOwnExp(2000000000)
Msg2Player("B¹n võa ®­îc t¨ng 1 Level !")
end

function no()
end
 
