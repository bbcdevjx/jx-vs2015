ARY_CITY_MAP =
{
	[11]	=	1,
	[1]		=	1,
	[37]	=	1,
	[176]	=	1,
	[162]	=	1,
	[78]	=	1,
	[80]	=	1,
}

ARY_FRESHMAN_MAP =
{
	[174]	=	1,
	[121]	=	1,
	[153]	=	1,
	[101]	=	1,
	[99]	=	1,
	[100]	=	1,
	[20]	=	1,
	[53]	=	1,
	[54]	=	1,
	[175]	=	1,
}

function IsCityMap(dwMapID)
	if (ARY_CITY_MAP[dwMapID] == 1) then
		return 1;
	else
		return 0;
	end
end

function IsFreshmanMap(dwMapID)
	if (ARY_FRESHMAN_MAP[dwMapID] == 1) then
		return 1;
	else
		return 0;
	end
end