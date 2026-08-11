Include("\\script\\lib\\worldlibrary.lua");
Include("\\script\\header\\npcfile.lua");
Include("\\script\\startgame\\traplib.lua");
Include("\\script\\startgame\\thon\\balanghuyen.lua");
Include("\\script\\startgame\\thon\\giangtanthon.lua");
Include("\\script\\startgame\\thon\\longmontran.lua");
Include("\\script\\startgame\\thon\\namnhactran.lua");
--Include("\\script\\startgame\\thon\\chutientran.lua");
--Include("\\script\\startgame\\thon\\daohuongthon.lua");
--Include("\\script\\startgame\\thon\\longtuyenthon.lua");
--Include("\\script\\startgame\\thon\\thachcotran.lua");
--Include("\\script\\startgame\\thon\\vinhlactran.lua");
Include("\\script\\startgame\\thanh\\tuongduong.lua");
Include("\\script\\startgame\\thanh\\bienkinh.lua");
Include("\\script\\startgame\\thanh\\daily.lua");
Include("\\script\\startgame\\thanh\\duongchau.lua");
Include("\\script\\startgame\\thanh\\laman.lua");
Include("\\script\\startgame\\thanh\\thanhdo.lua");
Include("\\script\\startgame\\thanh\\phuongtuong.lua");

--Include("\\script\\startgame\\monphai\\thieulam.lua");
--Include("\\script\\startgame\\monphai\\thienvuong.lua");
--Include("\\script\\startgame\\monphai\\duongmon.lua");
--Include("\\script\\startgame\\monphai\\ngudoc.lua");
--Include("\\script\\startgame\\monphai\\ngamy.lua");
--Include("\\script\\startgame\\monphai\\thuyyen.lua");
--Include("\\script\\startgame\\monphai\\thiennhan.lua");
--Include("\\script\\startgame\\monphai\\caibang.lua");
--Include("\\script\\startgame\\monphai\\vodang.lua");
--Include("\\script\\startgame\\monphai\\conlon.lua");

Include("\\script\\startgame\\tinhnang\\daotaytuy.lua");
Include("\\script\\startgame\\tinhnang\\bdtongkimcao.lua");
Include("\\script\\startgame\\tinhnang\\dienvotruong.lua");
Include("\\script\\startgame\\khac\\satthu.lua");--boss sat thu
Include("\\script\\startgame\\khac\\othermap.lua");--add npc linh tinh
Include("\\script\\startgame\\khac\\npcnhiemvu.lua");--add npc linh tinh
Include("\\script\\startgame\\monster\\trainingmap.lua");--add quai' luyen cong

function main()
	-- maps.pak owns traps: addtrapbalang()
-- maps.pak owns objects: addobjbalang()
	
	-- maps.pak owns traps: addtrapgiangtan()
-- maps.pak owns objects: addobjgiangtan()
	
	-- maps.pak owns traps: addtraplongmon()
-- maps.pak owns objects: addobjlongmon()
	
	-- maps.pak owns traps: addtrapnamnhac()
-- maps.pak owns objects: addobjnamnhac()

	--addnpcchutien()
	--addtrapchutien()
	--addobjchutien()
	--
	--addnpcdaohuong()
	--addtrapdaohuong()
	--addobjdaohuong()
    --
	--addnpclongtuyen()
	--addtraplongtuyen()
	--addobjlongtuyen()
	--
	--addnpcthachco()
	--addtrapthachco()
	--addobjthachco()
	--
	--addnpcvinhlac()
	--addtrapvinhlac()
	--addobjvinhlac()
	
	-- maps.pak owns traps: addtraptuongduong()
-- maps.pak owns objects: addobjtuongduong()
	
	-- maps.pak owns traps: addtrapbienkinh()
-- maps.pak owns objects: addobjbienkinh()
	
	-- maps.pak owns traps: addtrapdaily()
-- maps.pak owns objects: addobjdaily()
	
	-- maps.pak owns traps: addtrapduongchau()
-- maps.pak owns objects: addobjduongchau()
	
	-- maps.pak owns traps: addtraplaman()
-- maps.pak owns objects: addobjlaman()
	
	-- maps.pak owns traps: addtrapthanhdo()
-- maps.pak owns objects: addobjthanhdo()
	
	-- maps.pak owns traps: addtrapphuongtuong()
-- maps.pak owns objects: addobjphuongtuong()
	
	-- maps.pak owns traps: traptkcaocap()
-- maps.pak owns objects: objtkimcaocap()
	
--phan add tong hop cac loai khac

	-- maps.pak owns traps: addtrapother()
-- maps.pak owns objects: addobjother()
	
	-- maps.pak owns traps: addtraptaytuy()
	
	if(SERVER_MODE == 1) then
		local nCurTime = tonumber(GetLocalDate("%y%m%d%H%M"))
		if(nCurTime > SERVER_OPEN) then
			addfullnpc()
		end;
	else
		addfullnpc()
	end;
end

function addfullnpc()
	addnpcbalang()
	
	addnpcgiangtan()
	
	addnpclongmon()
	
	addnpcnamnhac()

	--addnpcchutien()
	--addtrapchutien()
	--addobjchutien()
	--
	--addnpcdaohuong()
	--addtrapdaohuong()
	--addobjdaohuong()
    --
	--addnpclongtuyen()
	--addtraplongtuyen()
	--addobjlongtuyen()
	--
	--addnpcthachco()
	--addtrapthachco()
	--addobjthachco()
	--
	--addnpcvinhlac()
	--addtrapvinhlac()
	--addobjvinhlac()
	
	addnpctuongduong()
	
	addnpcbienkinh()
	
	addnpcdaily()
	
	addnpcduongchau()
	
	addnpclaman()
	
	addnpcthanhdo()
	
	addnpcphuongtuong()
	
	npctkimcaocap()
	
--phan add tong hop cac loai khac
	addnpcsatthu()

	addnpcother()
	
	addnpctaytuy()
	
	addnpcdienvotruong()
	
	addnpcnhiemvu()
	addtrainingnpc()
end;
