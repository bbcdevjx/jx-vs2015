Include("\\script\\header\\taskid.lua");

function main()
	local nValue = GetTask(TASK_DUNGCHUNG1);
	local nTaskTime = GetTask(TASK_THOIGIAN3);
	local nCurTime = GetCurServerSec();
	if(GetRepute()<2 or (nCurTime - nTaskTime < 3600)) then
		Talk(1,"","Nha dÞch phñ Thµnh §«: V× d©n trõ häa, ai diÖt ®­îc mèi häa heo rõng ë 4 vïng, bæn phñ th­ëng ngay 500 l­îng vµ biÓu d­¬ng hµnh ®éng hiÖp nghÜa\nBè c¸o")
	return end
	if(GetNumber(1,nValue,8) ~= 1) then
	Say("Th«ng c¸o: GÇn ®©y c¸c vïng ngo¹i « bÞ heo rõng quÊy nhiÔu, ph¸ ho¹i mïa mµng, thËt lµ phiÒn phøc. §· treo gi¶i 500 l­îng b¹c ®Ó t×m dòng sÜ diÖt bµy heo rõng nµy. HÔ giÕt ®­îc bän chóng th× ®Õ nha m«n l·nh th­ëng",2,
	"B¶ng niªm yÕt/bangniemyet",
	"Kh«ng mµng/no");
	else
	Talk(1,"","Nha dÞch phñ Thµnh §«: NhiÒu dòng sÜ h¨ng h¸i v× d©n trõ häa, ®en l¹i sù b×nh yªn cho d©n chóng, chuÈn bÞ ®ãn nh÷ng tr¸ng sÜ chiÕn th»ng trë vÒ.");
	end;
end;

function bangniemyet()
	SetTask(TASK_DUNGCHUNG1,SetNumber(1,GetTask(TASK_DUNGCHUNG1),8,1));
	SetTask(TASK_DUNGCHUNG2,SetNumber(2,GetTask(TASK_DUNGCHUNG2),1,0));
	Talk(1,"","B¹n giËt lÊy b¶n th«ng c¸o, quyÕt t©m trõ h¹i gióp b¸ t¸nh");
end;

function no()
end;