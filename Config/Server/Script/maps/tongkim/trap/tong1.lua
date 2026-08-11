
function main(sel)
	local nPlayerDataIdx, nGroup;
	nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then	--neu da gia nhap roi
		nGroup = GetMSIdxGroup(1, nPlayerDataIdx)
		if(nGroup == 1) then	--nhom 1 da gia nhap phe Kim roi, ngung ham`
		return end
	SetPos(1251,3537)
	SetFightState(0)
		if(GetPMParam(1,nPlayerDataIdx,1) == 1) then --dang trong giai doan chien dau
			SetTimer(180*18,2)
		end
	end
end;