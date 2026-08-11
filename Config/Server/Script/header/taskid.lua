--hoangnhk
------TaskTemp------------------
ITEMINDEX	= 0
NPCINDEX	= 1
DESPLAYERID = 3	--for gm
SELSKILLNO = 4	--skill cua phai' so' x
HAVELOVE_MALE = 5		--Dang cau hon
HAVELOVE_FEMALE = 6		--playerindex cua nam
SEL_MOVEARRAY = 7			--lua chon mang~di chuyen
SEL_MOVEBEGIN = 8			--lua chon di chuyen
												--su dung	8->18
TEMP_TASK = 19
-------TASKID (loai lon)------------------
TASK_NAME = 0--ten nhan vat
TASK_LVGAMESEC = 1-- thoi gian roi mang
TASK_LVGAMEEXP = 2 --kinhnghiem tich luy roi mangcua nv
TASK_THIETLAHAN = 8
TASK_SHXT = 10
TASK_DUNGCHUNG = 11	--[1]da hoan thanh datau truoc do(phan thuong)
										--[2]ben kia bo phong lang do
										--[3][4]lan dat cuoc
										--[5][6]lan danh khinh cong
										--[7]loai khinh cong
										--[8]nv heo rung thanh do
										--[9]thanh thi dau thu
TASK_DUNGCHUNG2 = 12 --[1][2]an may thanh do[3][4]giet heo rung thanh do[5]dao nhan que[6]so lan giao thit[7][8]yeu cau thit tuoi[9]xuat su
TASK_DATAU_OLD = 13
TASK_DIADOCHI = 14	--[1][2][3]b¶n ®å --[4][5][6]s?l­îng t×m ®c [7][8][9]level cua update kinh nghiem
TASK_DATAU_NEED = 15
TASK_DATAU_ACCEPT = 16	--[1]NhËn nhiÖm v?[2]Lo¹i nhiÖm v?: 0: kh«ng giao, 1: c?giao vËt phÈm [3]®é kh?
													--[4][5][6]controng [7][8] loai update [9] loai item giao
TASK_DATAU_NUM = 17
TASK_LIENDAU_TIME = 18	--mua dau thu n
TASK_DAOTAYTUY = 19	--[1][2][3]mapcu[4]Taytuy[5][6]idrevive[7]loaitaytuy[8]colaothai[9]tieungu
TASK_BOOKS = 20	--[1][2]TTK[3][4]VLMT[5]phung nguyet[6]cong nguyet
--------------------------------
TASK_NVST = 21	--[1][2]nhan nv [3][4][5][6][7][8]NVLongngu [9]thanh thi return
TASK_TANTHU = 22		--[1]nhan item [2]hocskill9x[3]nhantop[4]testgame[5]ho tro tao bang hoi[6][7][8][9]thuongcap
TASK_NVDANHVONG = 23	--[1]nv thit heo[2]mieng thit [3]nv hai thuoc [4]noiduathuden [5]noibatdau dua thu	[6]aphuong [7]thuongquanthu [8]anmaylongmon [9]phu-hotu
TASK_THOIGIAN = 24	--THOI GIAN heo rung
TASK_THOIGIAN2 = 25	--THOI GIAN dichquan
TASK_LIENDAU = 26	--id data
TASK_RESET = 27	--[1]sudungHH[2]solanhaiHH [3]maxvuotai[4]longhuyethoan [5][6]luyenskill120moingay [7][8]max nvst[9]sudung qua HK
TASK_MOC_DATAU = 28	--nhan thuong moc da tau 9 o^
TASK_RESET2 = 29	--[1][2][3]datau max moi ngay[4]nhanthuongdatcuoc[5][6]hoadangmoingay[7][8]traloidunglientuc[9]thien tue
TASK_THOIGIAN3 = 30 --THOI GIAN nv heo rung thanh do
TASK_DATCUOCT = 31	--vong thi thu' n
TASK_DATCUOC1 = 32	--phu quy cam hap
TASK_DATCUOC2 = 33	--phu quy cam hap
TASK_DATCUOC3 = 34	--phu quy cam hap
TASK_DATCUOC4 = 35	--phu quy cam hap
TASK_DATCUOC5 = 36	--phu quy cam hap
TASK_DATCUOC6 = 37	--phu quy cam hap
TASK_THOIGIAN4 = 38	
TASK_THOIGIAN5 = 40 --THOI GIAN hai thuoc
TASK_RESET3 = 41 --[1]nau banh[3][4]thiet la han[5][6]cam nang hoang kim[7]so lan sd long huyethoan[8]so lan nv thongthuong trongngay
TASK_THOIGIAN6 = 42 --[1][2]luu ngay de resettask
TASK_RESET4 = 43 --ong chu co
TASK_NVTHONGTHUONG = 44 --[1][2][3][4]id quai nv thong thuong
TASK_RESETWEEK = 45 --[9]thu hien tai
TASK_THOIGIAN7 = 47 --xoa mat ma
TASK_THOIGIAN8 = 48 --THOI GIAN nv thit tuoi
TASK_THITTUOI = 49 -- so luong thit tuoi
TASK_NVDANHVONG2 = 50 --[1][2][3][4][5][6][7]thoi gian nv lien ket vo lam[8]ngolaogia-giangtan[9]gianna-hotu
TASK_THOIGIAN9	= 52 --THOI GIAN nhan danh vong
TASK_DUNGCHUNG3 = 53 --[1]tui tu mau[3][4]nv thong thuong[5]phe hien tai[7][8][9]ngoi tu
TASK_NVDANHVONG3 = 54 --[1][2][3][4]tim hieu cac mon phai [5]nv lien ket vo lam

-- TASK ID AUDIT: consolidated from active C++ and Lua sources (2026-07-29)
-- Cac ID duoi day giu nguyen bo cuc du lieu cu; khong tu y doi sau khi da phat hanh.

-- Alias/ID bi thieu trong cac script nhiem vu hien tai
TASK_DUNGCHUNG1 = 39 -- dung bo sung cho co nhiem vu o thu 8
TASK_TINHNANG = 46 -- du lieu dich quan/tinh nang
TASK_TAYTUYKINH = 20 -- alias cua TASK_BOOKS; o 5/6 la Phung Nguyet/Cong Nguyet
TASK_EVENT = 55 -- du lieu su kien Rose
TASK_EVENT2 = 56 -- kinh nghiem su kien Love Chocolate
TASK_VANTIEU = 57 -- trang thai van tieu
TASK_NPCVANTIEU = 58 -- ID NPC tieu xa dang bao ve
TASK_RESET5 = 59 -- gioi han ngay cua van tieu/cuop tieu

-- ID lich su 60-73. Mot so tinh nang cu co chu y dung chung ID; khong doi so.
BW_SIGNPOSWORLD = 60
BW_SIGNPOSX = 61
BW_SIGNPOSY = 62
SB_EVENT_CRUSTG = 60
SB_EVENT_STAGE = {61, 62, 63, 64, 65, 66, 67, 68, 69, 70}
TASKID_FY_START_ONLINE_TIME = 70
TASKID_FY_ADDITIONAL_TIME = 71
TASKID_GAIN_LAST_DATE = 72
TASKID_GAIN_TIMES_IN_DAY = 73

-- Su do: 10 o chuoi ten de tu 74 den 83, sau do la du lieu xuat su.
TASK_SHITU_NAME = 74
TASK_SHITU_NAME1 = 74
TASK_SHITU_NAME2 = 75
TASK_SHITU_NAME3 = 76
TASK_SHITU_NAME4 = 77
TASK_SHITU_NAME5 = 78
TASK_SHITU_NAME6 = 79
TASK_SHITU_NAME7 = 80
TASK_SHITU_NAME8 = 81
TASK_SHITU_NAME9 = 82
TASK_SHITU_NAME10 = 83
TASK_SHITU_XSU = 84

-- Thong ke Ngu Doc chi thu. Day la cac ten da duoc script su dung nhung truoc day chua khai bao.
TB_BONUS_SCORE = 85
TB_BONUS_TIME = 86
TB_BONUS_RELATION = 87
TB_BONUS_PLAYED = 88
TB_BONUS_FINISHED = 89
TB_BONUS_STAGE = 90
TB_BONUS_KILLED = 91
TB_BONUS_BECAPTAIN = 92

-- Vung task noi bo cua Core/GameServer. Khai bao tai day de Lua khong chiem nham.
TASKVALUE_SAVEWAYPOINT_BEGIN = 101 -- 101..103
TASKVALUE_SAVEWAYPOINT_END = 103
TASKVALUE_SAVESTATION_BEGIN = 110 -- 110..141
TASKVALUE_SAVESTATION_END = 141
TASKVALUE_TIMERTASK_TAST = 200
TASKVALUE_TIMERTASK_RESTTIME = 201
TASKVALUE_BASEDATA_PASSWORD = 202
TASKVALUE_BASEDATA_MATENAME = 203
TASKVALUE_STATTASK_BEGIN = 210
TASKVALUE_STATTASK_REPUTE = 210
TASKVALUE_STATTASK_FUYUAN = 211
TASKVALUE_STATTASK_ACCUM = 212
TASKVALUE_STATTASK_ACCUMSTAT1 = 213
TASKVALUE_STATTASK_ACCUMSTAT2 = 214
TASKVALUE_STATTASK_HONOR = 215
TASKVALUE_STATTASK_HONORSTAT = 216
TASKVALUE_STATTASK_RESPECT = 217
TASKVALUE_STATTASK_TIMESTAT = 218
TASKVALUE_STATTASK_VIPRANK = 219
TASKVALUE_STATTASK_NUM = 220

--cac du lieu data int--
DATA_DICEMONEY = 0 -- tien chu song bac
DATA_DUATOP = 11
DATA_DATCUOC = 12 --dat cuoc
DATA_DCHAVERES = 13 --dat cuoc
DATA_DCBEGIN = 21 --dat cuoc
DATA_DCEND = 30 --dat cuoc
DATA_MAPVUOTAI	= 40 --40-46