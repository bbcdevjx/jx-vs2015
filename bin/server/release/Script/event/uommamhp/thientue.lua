Include("\\script\\event\\uommamhp\\lib.lua")

function main(nNpcIndex)
	local DOITHOAI = "";
	local DIALOG={};
	if (GetNpcOwner(nNpcIndex) ~= GetName()) then
		DOITHOAI = GetNpcOwner(nNpcIndex).." trÂng <color=green><npc><color>: Chµo mıng ngµy Æ t n≠Ìc Æ≠Óc gi∂i ph„ng!";
	else
		if (GetNpcValue(nNpcIndex) > 0) then
			DOITHOAI = format("Ng≠¨i Æ∑ trÂng <color=green>%s<color> vµ Æ∑ nhÀn Æ≠Óc <color=green>%d<color> Æi”m. Khi nµo Æi”m t›ch lÚy bªng <color=green>%d<color> th◊ c„ th” nhÀn th≠Îng Æ≠Óc rÂi!",
												GetNpcName(nNpcIndex), GetNpcValue(nNpcIndex), GetNpcParam(nNpcIndex,1));
			if (GetNpcValue(nNpcIndex) ~= GetNpcParam(nNpcIndex,1)) then
				tinsert(DIALOG, format("B„n ph©n (ßi”m t›ch lÚy hi÷n tπi g p 2 l«n)/congcu(%d,%d)",nNpcIndex, 1))
				tinsert(DIALOG, format("T≠Ìi n≠Ìc (ßi”m t›ch lÚy hi÷n tπi cÈng 2 l«n)/congcu(%d,%d)",nNpcIndex, 2))
				tinsert(DIALOG, format("Gi’t s©u b‰ (ßi”m t›ch lÚy hi÷n tπi trı 2 l«n)/congcu(%d,%d)",nNpcIndex, 3))
			else
				tinsert(DIALOG, format("Ta muËn nhÀn th≠Îng/nhanthuong(%d)",nNpcIndex))
			end
		else
			DOITHOAI = GetNpcOwner(nNpcIndex).." trÂng <color=green><npc><color>: Chµo mıng ngµy Æ t n≠Ìc Æ≠Óc gi∂i ph„ng!";
		end;
	end
	tinsert(DIALOG, "RÍi kh·i/no");
	Say("LINK:<npc>",0,DOITHOAI,getn(DIALOG),DIALOG);
end

function congcu(nNpcIndex,nToolID)
	if (PLANT_TOOL[nToolID]) then
		if(DelItem(1,0,PLANT_TOOL[nToolID][2][1],PLANT_TOOL[nToolID][2][2])) == 1 then
			if(nToolID==1) then
			SetNpcValue(nNpcIndex,GetNpcValue(nNpcIndex)*PLANT_TOOL[nToolID][3]);
			elseif(nToolID==2) then
			SetNpcValue(nNpcIndex,GetNpcValue(nNpcIndex)+PLANT_TOOL[nToolID][3]);
			elseif(nToolID==3) then
			SetNpcValue(nNpcIndex,GetNpcValue(nNpcIndex)-PLANT_TOOL[nToolID][3]);
			end
			main(nNpcIndex);
		else
			Talk(1, "", format("H◊nh nh≠ c∏c hπ qu™n Æem <color=yellow>%s<color>!",PLANT_TOOL[nToolID][1]));
		end
	end
end

function nhanthuong(nNpcIndex)
	if (nNpcIndex <= 0 )  then
		return
	end
	PIdx = NpcIdx2PIdx(nNpcIndex);
	if (PIdx > 0) then 
		return
	end;
	
	for i=1,getn(THIENTUE_TEMPLET) do
		if(THIENTUE_TEMPLET[i][2]==GetNpcName(nNpcIndex)) then
			AddOwnExp(THIENTUE_EXP[i]);
		end
	end
	SetNpcValue(nNpcIndex,0);
end

function Timeout(nNpcIndex)
end

function no()
end