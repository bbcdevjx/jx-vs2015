Include("\\script\\lib\\worldlibrary.lua");
Include("\\script\\header\\npcfile.lua")
MAX_HUYHOANG_PER_DAY = 5
TIME_SWITCH = 5400
--hat huy hoang - hoang km
HUYHOANG_THAP={
[1] = "Hπt Huy Hoµng s¨",
[2] = {
	{320,43532,94632},
	{320,43241,95234},
	{320,42979,94646},
	{320,42624,94884},
	{320,42228,94700},
	{320,42054,95334},
	{320,41710,94732},
	{320,41445,95572},
	{320,41141,94742},
	{320,40816,95500}
}
};

HUYHOANG_TRUNG={
[1] = "Hπt Huy Hoµng trung",
[2] = {
	{322,54493,113656},
	{322,54558,114484},
	{322,54812,113986},
	{322,55036,114376},
	{322,55124,113610},
	{322,55381,113936},
	{322,55772,113664},
	{322,55984,114264},
	{322,56159,113692},
	{322,56398,113358}
	}
};

HUYHOANG_CAO={
[1] = "Hπt Huy Hoµng cao",
[2] = {
	{340,56247,93582},
	{340,55963,93236},
	{340,55636,92946},
	{340,55354,93104},
	{340,55046,93204},
	{340,54851,92690},
	{340,54450,92720},
	{340,54664,93406},
	{340,54171,93316},
	{340,54094,92618}
	}
};

function addhhh()
	local nNpcIdx;
	for i=1,getn(HUYHOANG_THAP[2]) do
	nNpcIdx = AddNpcNew(1110,1,HUYHOANG_THAP[2][i][1],HUYHOANG_THAP[2][i][2],HUYHOANG_THAP[2][i][3],HATHH_FILE,6)
	SetNpcParam(nNpcIdx,1,1);
	SetNpcTimeout(nNpcIdx, TIME_SWITCH)
	end
	
	for i=1,getn(HUYHOANG_TRUNG[2]) do
	nNpcIdx = AddNpcNew(1110,1,HUYHOANG_TRUNG[2][i][1],HUYHOANG_TRUNG[2][i][2],HUYHOANG_TRUNG[2][i][3],HATHH_FILE,6)
	SetNpcParam(nNpcIdx,1,2);
	SetNpcTimeout(nNpcIdx, TIME_SWITCH)
	end
	
	for i=1,getn(HUYHOANG_CAO[2]) do
	nNpcIdx = AddNpcNew(1110,1,HUYHOANG_CAO[2][i][1],HUYHOANG_CAO[2][i][2],HUYHOANG_CAO[2][i][3],HATHH_FILE,6)
	SetNpcParam(nNpcIdx,1,3);
	SetNpcTimeout(nNpcIdx, TIME_SWITCH)
	end
	
	nNpcIdx = AddNpcNew(1117,1,336,46332,95226,HATHH_FILE,6);
	SetNpcParam(nNpcIdx,1,4);
	SetNpcTimeout(nNpcIdx, TIME_SWITCH);
	
	--thong bao--
	local commonstr = "<color=Yellow>%s<color> xu t hi÷n tπi %s (%d,%d)"
	Msg2SubWorld(format(commonstr,HUYHOANG_THAP[1],GetWorldName(HUYHOANG_THAP[2][1][1]),floor(HUYHOANG_THAP[2][1][2]/256), floor(HUYHOANG_THAP[2][1][3]/512)));
	Msg2SubWorld(format(commonstr,HUYHOANG_TRUNG[1],GetWorldName(HUYHOANG_TRUNG[2][1][1]),floor(HUYHOANG_TRUNG[2][1][2]/256), floor(HUYHOANG_TRUNG[2][1][3]/512)));
	Msg2SubWorld(format(commonstr,HUYHOANG_CAO[1],GetWorldName(HUYHOANG_CAO[2][1][1]),floor(HUYHOANG_CAO[2][1][2]/256), floor(HUYHOANG_CAO[2][1][3]/512)));
	Msg2SubWorld("<color=Yellow>Hπt Hoµng Kim<color> sæp k’t tr∏i tπi Phong L®ng ßÈ (180,185)");	
end