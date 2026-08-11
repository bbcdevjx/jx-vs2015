--Binh si hieu phu
--Ken Nguyen
Include("\\script\\header\\forbidmap.lua")
Include("\\script\\lib\\worldlibrary.lua");
MS_CALLNPCCOUNT_S = 20
MS_CALLNPCCOUNT_J = 21
MAX_CALLNPCCOUNT = 20
function main(nItemIdx)	-- 
	if (GetFightState() == 0) then
		Talk(1,"","Kh«ng thÓ sö dông trong t×nh tr¹ng phi chiÕn ®Êu!")
		return
	end;
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	if (GetCurCamp() == 1) then
		if (GetMissionV(MS_CALLNPCCOUNT_S) >= MAX_CALLNPCCOUNT) then
			Msg2Player("HiÖn t¹i sè l­îng hiÖu gi¸c ChiÕn tr­êng sö dông ®· v­ît møc, kh«ng thÓ sö dông tiÕp n÷a. ")
			return
		else
			SetMission(MS_CALLNPCCOUNT_S, GetMissionV(MS_CALLNPCCOUNT_S) + 1)
		end
	elseif (GetCurCamp() == 2) then
		if (GetMissionV(MS_CALLNPCCOUNT_J) >= MAX_CALLNPCCOUNT) then
			Msg2Player("HiÖn t¹i sè l­îng hiÖu gi¸c ChiÕn tr­êng sö dông ®· v­ît møc, kh«ng thÓ sö dông tiÕp n÷a. ")
			return
		else
			SetMission(MS_CALLNPCCOUNT_J, GetMissionV(MS_CALLNPCCOUNT_J) + 1)		
		end
	end
	local W,X,Y = GetWorldPos();
		if( GetCurCamp() == 1) then
			CallSjNpc( 682, 100, W, floor(X/32), floor(Y/32), "Tèng binh");
		elseif( GetCurCamp() == 2) then
			CallSjNpc( 688, 100, W, floor(X/32), floor(Y/32), "Kim binh");
		end
	RemoveItem(nItemIdx,1,1);
end	

function CallSjNpc(NpcId, NpcLevel, W, X, Y, Name)
	local playername = GetName().." ";
	local nNpcIdx;
	nNpcIdx = AddNpcNew(NpcId,NpcLevel, W,( X -  3 ) * 32, Y * 32,"\\script\\feature\\tongkim\\die_binhsi.lua",
		nil,playername..Name,1,RANDOMC(0,1,2,3,4),0,50000,nil,1000,200,150,250,nil,nil,30,nil,nil);
	AddMSNpc(1,nNpcIdx);
	nNpcIdx = AddNpcNew(NpcId,NpcLevel, W,( X +  3 ) * 32, Y * 32,"\\script\\feature\\tongkim\\die_binhsi.lua",
		nil,playername..Name,1,RANDOMC(0,1,2,3,4),0,50000,nil,1000,200,150,250,nil,nil,30,nil,nil);
	AddMSNpc(1,nNpcIdx);
end