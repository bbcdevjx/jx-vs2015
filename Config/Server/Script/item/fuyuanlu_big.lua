-- Phuc Duyen Lo Dai
Include("\\script\\header\\fuyuan.lua");
function main(nItemIdx)
	if( FuYuan_Add( 50 ) ~= 1 ) then
		Msg2Player( "B¹n t¹m thêi ch­a thÓ sö dông Phóc Duyªn, tr­íc tiªn h·y ®i t×m Vâ L©m Minh Chñ TruyÒn Nh©n ë c¸c thµnh thÞ lín ®Ó më c«ng n¨ng nµy. " );
		return 1;
	end	
	RemoveItem(nItemIdx,1)
end