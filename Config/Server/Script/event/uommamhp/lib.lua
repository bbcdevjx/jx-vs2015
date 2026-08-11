Include("\\script\\header\\taskid.lua")
Include("\\script\\lib\\worldlibrary.lua")

PLANT_TOOL = {
[1] = {"Tói Ph©n Bãn",{6,2304},2,10000},
[2] = {"Thïng N­íc",{6,2305},2,10000},
[3] = {"Thuèc Trõ S©u",{6,2306},2,10000},
}

EVENT_START_DATE = 20150101
EVENT_END_DATE 	= 20160101
USE_MINLEVEL 	= 50
USE_DAILY_LIMIT = 8
TREE_TIME_LIMIT = 15*60*18
SCRIPT_TREEDLG = "\\script\\event\\uommamhp\\thientue.lua"
DAILY_TIME_LIMIT ={
{1300,1600},
{1830,2130},
}

THIENTUE_TEMPLET = {
{1552, "Thiªn TuÕ An Lµnh"},
{1551, "Thiªn TuÕ Hßa B×nh"},
{1550, "Thiªn TuÕ §éc LËp"},
{1555, "Thiªn TuÕ Tù Do"},
{1554, "Thiªn TuÕ H¹nh Phóc"},
{1553, "Thiªn TuÕ ThÞnh V­îng"},
}

THIENTUE_RATE = {
{1,2,3,4,5,6},
{20,20,20,20,10,10},
}

THIENTUE_EXP = {
[1]	= 5000000,
[2]	= 10000000,
[3]	= 20000000,
[4]	= 30000000,
[5]	= 40000000,
[6]	= 300000000,
}

BASE_SCORE_RATE = 34