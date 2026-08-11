
#ifndef COREUSENAMEDEF_H
#define COREUSENAMEDEF_H

#define		MAX_PLAYER_IN_ACCOUNT			3

#define		SETTING_PATH					"\\settings"

//---------------------------- npc res ??? ------------------------------
#define		RES_INI_FILE_PATH				"\\settings\\entity_res"
#define		RES_NPC_STYLE_PATH				"\\spr\\npcres\\style"
#define		RES_SOUND_FILE_PATH				"sound"

#define		NPC_RES_KIND_FILE_NAME			"\\settings\\entity_res\\entity_type.txt"
#define		NPC_NORMAL_RES_FILE				"\\settings\\entity_res\\npc_resource.txt"
#define		NPC_NORMAL_SPRINFO_FILE			"\\settings\\entity_res\\npc_resource_info.txt"
#define		STATE_MAGIC_TABLE_NAME			"\\settings\\entity_res\\state_graphics_map.txt"
#define		PLAYER_RES_SHADOW_FILE			"\\settings\\entity_res\\player_action_shadow_map.txt"
//#define		NPC_RES_SHADOW_FILE				"普通npc动作阴影对应表.txt"
#define		PLAYER_SOUND_FILE				"\\settings\\entity_res\\主角动作声音表.txt"
#define		NPC_SOUND_FILE					"\\settings\\entity_res\\npc动作声音表.txt"

#define		NPC_ACTION_NAME					"npc_action_map.txt"
#define		ACTION_FILE_NAME				"action_id_map.txt"

#define		PLAYER_MENU_STATE_RES_FILE		"\\settings\\entity_res\\ui_state_graphics_map.txt"
#define		PLAYER_INSTANT_SPECIAL_FILE		"\\settings\\entity_res\\instant_effect.txt"

#define		SPR_INFO_NAME					"_info"
#define		KIND_NAME_SECT					"CharacterType"
#define		KIND_NAME_SPECIAL				"SpecialNpc"
#define		KIND_NAME_NORMAL				"NormalNpc"
#define		KIND_FILE_SECT1					"PartFileName"
#define		KIND_FILE_SECT2					"WeaponActionTab1"
#define		KIND_FILE_SECT3					"WeaponActionTab2"
#define		KIND_FILE_SECT4					"ActionRenderOrderTab"
#define		KIND_FILE_SECT5					"ResFilePath"

//--------------------------- player ??????? ------------------------------
// ?????????????l????? ?? ?? l l ? ? ?? ?? ?? ?? ?????????
#define		FACTION_FILE					"\\settings\\entity\\player_faction.ini"

//--------------------------- player PK??? ------------------------------
#define		defPK_PUNISH_FILE				"\\settings\\entity\\player_pk_punish.txt"

//--------------------------- player ?????? ------------------------------
#define		defPLAYER_TONG_PARAM_FILE		"\\settings\\entity\\tong_config.ini"


//----------------------------- ??????? ------------------------------
#define		CHAT_PATH						"\\chat"
#define		CHAT_TEAM_INFO_FILE_NAME		"Team.cht"
#define		CHAT_CHANNEL_INFO_FILE_NAME		"Channel.cht"

#define		CHAT_CHANNEL_NAME_ALL			"World"
#define		CHAT_CHANNEL_NAME_SCREEN		"Nearby"
#define		CHAT_CHANNEL_NAME_SINGLE		"Friend"
#define		CHAT_CHANNEL_NAME_TEAM			"Team"
#define		CHAT_CHANNEL_NAME_FACTION		"Faction"
#define		CHAT_CHANNEL_NAME_TONG			"Guild"
#define		CHAT_CHANNEL_NAME_SCREENSINGLE	"Whisper"
#define		CHAT_CHANNEL_NAME_SYSTEM		"System"

#define		CHAT_TAKE_CHANNEL_NAME_TEAM			"Team"
#define		CHAT_TAKE_CHANNEL_NAME_FACTION		"Faction"
#define		CHAT_TAKE_CHANNEL_NAME_TONG			"Guild"
#define		CHAT_TAKE_CHANNEL_NAME_SCREENSINGLE	"Whisper"

//---------------------------- player ?????? ------------------------------
#define		PLAYER_LEVEL_EXP_FILE			"\\settings\\entity\\player_level_exp.txt"
#define		PLAYER_LEVEL_ADD_FILE			"\\settings\\entity\\player_prop_add.txt"
#define		PLAYER_LEVEL_LEAD_EXP_FILE		"\\settings\\entity\\player_lead_exp.txt"
#define		BASE_ATTRIBUTE_FILE_NAME		"\\settings\\entity\\player_base_attribute.ini"
#define		PLAYER_PK_RATE_FILE				"\\settings\\entity\\player_pk_rate.ini"
#define		PLAYER_BASE_VALUE				"\\settings\\entity\\player_base_value.ini"

// 00??? 01U?? 02??l 03Ul 04??? 05U? 06??? 07U?? 08???? 09U??
#define		NEW_PLAYER_INI_FILE_NAME		"\\settings\\entity\\player_create_new_%02d.ini"

//---------------------------- player ??????? ------------------------------
#define		BUYSELL_FILE					"\\settings\\buysell.txt"
#define		GOODS_FILE						"\\settings\\goods.txt"

//----------------------------- ?????? ------------------------------
#define		CHANGERES_MELEE_FILE			"\\settings\\item\\MeleeRes.txt"
#define		CHANGERES_RANGE_FILE			"\\settings\\item\\RangeRes.txt"
#define		CHANGERES_ARMOR_FILE			"\\settings\\item\\ArmorRes.txt"
#define		CHANGERES_HELM_FILE				"\\settings\\item\\HelmRes.txt"
#define		CHANGERES_HORSE_FILE			"\\settings\\item\\HorseRes.txt"
#define		ITEM_ABRADE_FILE				"\\settings\\item\\AbradeRate.ini"

//--------------- npc skill missles ???l???????????g?? -------------
#define		SKILL_SETTING_FILE				"\\settings\\entity\\skill_list.txt"
#define		MISSLES_SETTING_FILE			"\\settings\\entity\\skill_missles.txt"
#define		NPC_SETTING_FILE				"\\settings\\entity\\npc_list.ini"
#define		NPC_GOLD_TEMPLATE_FILE			"\\settings\\npc\\NpcGoldTemplate.txt"

//---------------------------- object ??? ------------------------------
#define		OBJ_DATA_FILE_NAME		"\\settings\\entity\\obj_list.txt"
#define		MONEY_OBJ_FILE_NAME		"\\settings\\entity\\obj_money.txt"
#define		OBJ_NAME_COLOR_FILE		"\\settings\\entity\\obj_color.ini"

//---------------------------- ??????? -------------------------------
#define		defLITTLE_MAP_SET_FILE	"\\Ui\\Default\\???????.ini"

//----------------------------- ??????? --------------------------------
#define		defINSTANT_SOUND_FILE	"\\settings\\SoundList.txt"
#define		defMUSIC_SET_FILE		"\\settings\\music\\MusicSet.txt"
#define		defMUSIC_FIGHT_SET_FILE	"\\settings\\music\\MusicFightSet.ini"

//------------------------------------------------------------------------
#define NPC_LEVELSCRIPT_FILENAME		"\\script\\npclevelscript\\npclevelscript.lua"	// Check l?i c?d鵱g kh鬾g
//#define NPC_TEMPLATE_BINFILEPATH		"\\settings"
#define NPC_TEMPLATE_BINFILE			"NpcTemplate.Bin"
#define WEAPON_PHYSICSSKILLFILE			"\\settings\\entity\\skill_weapon.txt"				
#define WEAPON_PARTICULARTYPE			"ParticularType"
#define	WEAPON_DETAILTYPE				"DetailType"
#define	WEAPON_SKILLID					"PhysicsSkillID"
//-----------------------------------------------------------------------
#define	WORLD_WAYPOINT_TABFILE			"\\settings\\WayPoint.txt"
#define WORLD_STATION_TABFILE			"\\settings\\Station.txt"
#define WORLD_STATIONPRICE_TABFILE		"\\settings\\StationPrice.txt"
#define WORLD_WAYPOINTPRICE_TABFILE		"\\settings\\WayPointPrice.txt"
#define WORLD_DOCK_TABFILE				"\\settings\\Wharf.txt"
#define WORLD_DOCKPRICE_TABFILE			"\\settings\\WharfPrice.txt"
#define STRINGRESOURSE_TABFILE			"\\settings\\StringResource.txt"
#define PLAYER_RANK_SETTING_TABFILE		"\\settings\\RankSetting.txt"	
#define QUESTITEM_TABFILE				"\\settings\\item\\questkey.txt"

//---------------------------------????--------------------------
#define TASK_MISSION_SETTING_TABFILE	"\\settings\\task\\missions.txt"



//---------------------------- ?????? ------------------------------
// ?????????????????????????32???????? %d %s ???????????????????
#define		MSG_GET_EXP	"Nh薾 頲 %I64d 甶觤 kinh nghi謒" //						"?????%I64d???????"
#define		MSG_DEC_EXP	"B筺 t鎛 th蕋 <color=green>%I64d <color>甶觤 kinh nghi謒" //						"???????%I64d???????"
#define		MSG_LEVEL_UP	"Ъng c蕄 t %d c蕄" //					"???j????????%d??"
#define		MSG_LEADER_LEVEL_UP	"Ъng c蕄 th鑞g so竔 c馻 b筺 t c蕄 %d" //				"???????????????%d??"
#define		MSG_GET_ATTRIBUTE_POINT	"B筺 c?%d 甶觤 ti襪 n╪g" //			"?????%d??????"
#define		MSG_GET_SKILL_POINT	"B筺 c?%d 甶觤 k?n╪g" //				"?????%d???????"
#define		MSG_GET_ATTRIBUTE_SKILL_POINT	"B筺 c?%d 甶觤 ti襪 n╪g %d 甶觤 k?n╪g"//	"?????%d??????%d???????"

#define		MSG_TEAM_AUTO_REFUSE_INVITE		"??????????????????????"
#define		MSG_TEAM_NOT_AUTO_REFUSE_INVITE	"???????????????????"
#define		MSG_TEAM_SEND_INVITE	"B筺 g鰅 n %s l阨 m阨 gia nh藀 t?i" //			"????%s???????????"
#define		MSG_TEAM_GET_INVITE	"чi trng %s g鰅 l阨 m阨 gia nh藀 t?i n b筺" //				"%s??????????"
#define		MSG_TEAM_REFUSE_INVITE	"Ngi ch琲 %s t?ch鑙 l阨 gia nh藀 t?i c馻 nh鉳 b筺" //		"%s????????????????"
// #define		MSG_TEAM_APPLY_INVITE_FAIL		"Nh鉳 m?b筺 v鮝 ng ?gia nh藀 kh玭g t錸 t筰"
// #define		MSG_TEAM_APPLY_INVITE_FAIL2		"Nh鉳 m?b筺 v鮝 ng ?gia nh藀  ng ch鴆 n╪g chi猽 m?
#define		MSG_TEAM_CREATE		"B筺 s竛g l藀 n猲 m閠 nh鉳 m韎" //				"????????h?????"
#define		MSG_TEAM_CREATE_FAIL	"S竛g l藀 nh鉳 th蕋 b筰." //		"??????????"
// #define		MSG_TEAM_CREATE_FAIL1			"PK m?h譶h bang chi課 kh玭g th?s竛g l藀 nh鉳 m韎!"
#define		MSG_TEAM_CANNOT_CREATE		"B筺 hi謓 gi?kh玭g th?l藀 nh鉳!" //			"?????????????"
#define		MSG_TEAM_TARGET_CANNOT_ADD_TEAM	"цi phng hi謓 gi?kh玭g th?l藀 nh鉳!" //	"??????????????"
// #define		MSG_TEAM_IS_FULL				"Nh鉳 m?b筺 xin ph衟 gia nh藀   s?lng"
#define		MSG_TEAM_OPEN		"Nh鉳 c馻 b筺 hi謓 t筰 c?th?ti誴 nh薾 th祅h vi猲 m韎" //					"???K????????????????????"
#define		MSG_TEAM_CLOSE		"Nh鉳 c馻 b筺 hi謓 t筰 kh玭g th?ti誴 nh薾 th祅h vi猲 m韎" //				"???K?????????????????????"
// #define		MSG_TEAM_MODEPICK_SELF			"T?nh苩"
// #define		MSG_TEAM_MODEPICK_FREE			"T?do nh苩"
// #define		MSG_TEAM_MODEPICK_CAPTAIN		"чi trng nh苩"
// #define		MSG_TEAM_MODEPICK_ALTERNATE		"Lu﹏ phi猲 nh苩"
// #define		MSG_TEAM_PKFOLLOW_OPEN			"B筺 m?ch? PK theo nh鉳"
// #define		MSG_TEAM_PKFOLLOW_CLOSE			"B筺 ng ch? PK theo nh鉳"
#define		MSG_TEAM_ADD_MEMBER	"%s tr?th祅h b籲g h鱱 c馻 nh鉳 b筺." //				"%s??????K??????"
#define		MSG_TEAM_SELF_ADD	"B筺  tham gia nh鉳 c馻 %s" //				"??????%s?K???"
// define		MSG_TEAM_ADDMEMBER_NOTVALID		"B筺 kh玭g th?tham gia nh鉳 c馻 ngi ch琲 m韎"
#define		MSG_TEAM_DISMISS_CAPTAIN	"B筺  gi秈 t竛 nh鉳 c馻 m譶h" //	"???????????K???"
#define		MSG_TEAM_DISMISS_MEMBER	"%s gi秈 t竛 nh鉳!" //			"%s????????"
#define		MSG_TEAM_KICK_ONE	"%s b?khai tr?kh醝 nh鉳" //				"%s????????????"
#define		MSG_TEAM_BE_KICKEN	"B筺 b?khai tr?kh醝 nh鉳" //			"??????????????"
#define		MSG_TEAM_APPLY_ADD	"%s xin ph衟 gia nh藀 nh鉳!" //				"%s??????????"
#define		MSG_TEAM_APPLY_ADD_SELF_MSG	"B筺 g鰅 l阨 xin ph衟 gia nh藀 t?i c馻 %s" //		"?????????%s?K???"
#define		MSG_TEAM_LEAVE		"%s r阨 kh醝 nh鉳." //				"%s??????"
#define		MSG_TEAM_LEAVE_SELF_MSG	"B筺  r阨 kh醝 nh鉳 c馻 %s" //		"????%s?K???"
#define		MSG_TEAM_CHANGE_CAPTAIN_FAIL1	"Фm nh薾 nh鉳 trng th蕋 b筰!" //	"???????????"
#define		MSG_TEAM_CHANGE_CAPTAIN_FAIL2	"%s kh玭g  s鴆 th鑞g so竔!" //	"%s??????????"
#define		MSG_TEAM_CHANGE_CAPTAIN_FAIL3	"Kh玭g th?giao ch鴆 v?i trng cho ngi m韎 ch琲" //	"???K???????????????"
#define		MSG_TEAM_CHANGE_CAPTAIN	"%s 頲 m nh薾 l?nh鉳 trng" //			"%s????????????"
#define		MSG_TEAM_CHANGE_CAPTAIN_SELF	"B筺 頲 h?th鑞g ch?nh l?nh鉳 trng" //	"????%s??????????"

//#define		MSG_CHATROOM_CREATE				"B筺 t筼 ph遪g m韎 %s"
//#define		MSG_CHATROOM_CREATE_ERROR_SAMENAME	"T猲 n祔  t錸 t筰"
//#define		MSG_CHATROOM_CREATE_ERROR_SAMEHOST	"B筺  t筼 m閠 ph遪g r錳"
//#define		MSG_CHATROOM_CREATE_ERROR_NAME	"T猲 kh玭g h頿 l?
//#define		MSG_CHATROOM_CREATE_ERROR_PASS	"M藅 m?ph遪g kh玭g h頿 l?
//#define		MSG_CHATROOM_CREATE_ERROR_ROOMFULL	"S?ph遪g t竛 g蓇 c馻 m竬 ch?n祔  , kh玭g th?t筼 th猰"
//#define		MSG_CHATROOM_SELF_JOIN			"B筺 v祇 ph遪g %s"
//#define		MSG_CHATROOM_JOIN				"%s  v祇 ph遪g"
//#define		MSG_CHATROOM_JOIN_FAIL1			"B筺 nh藀 sai m藅 m?ph遪g %s"
//#define		MSG_CHATROOM_JOIN_FAIL2			"B筺 b?li謙 v祇 s?甧n kh玭g th?ng nh藀 v祇 ph遪g %s"
//#define		MSG_CHATROOM_JOIN_FAIL3			"Ph遪g %s  y"
//#define		MSG_CHATROOM_SELF_LEAVE			"B筺 r阨 kh醝 ph遪g %s"
//#define		MSG_CHATROOM_LEAVE				"%s r阨 kh醝 ph遪g"
//#define		MSG_CHATROOM_SELF_DELETE		"B筺  h駓 ph遪g %s"
//#define		MSG_CHATROOM_SELF_FORCELEAVE	"B筺 b?y kh醝 ph遪g %s"
//#define		MSG_CHATROOM_SELF_BEKICK		"B筺 b?khai tr?kh醝 ph遪g %s"
//#define		MSG_CHATROOM_BEKICK				"%s b?khai tr?kh醝 ph遪g"
//#define		MSG_CHATROOM_ADDBLACKLIST		"Th猰 %s v祇 s?甧n"
//#define		MSG_CHATROOM_ADDBLACKLIST_FAIL	"Th猰 %s v祇 s?甧n th蕋 b筰"
//#define		MSG_CHATROOM_REMOVEBLACKLIST	"Lc b?%s kh醝 s?甧n"
//#define		MSG_CHATROOM_SELD_CHANGEPW		"B筺  i m藅 m?ph遪g %s"
//#define		MSG_CHATROOM_OPENGAME			"Lt ch琲 m韎 頲 m? l莕 n祔 t t鑙 產 %d 甶觤"
//#define		MSG_CHATROOM_REVERSE			"Lt ch琲 c馻 ph遪g %s  k誸 th骳"


#define		MSG_CHAT_APPLY_ADD_FRIEND	"B筺 n %s xin ph衟 頲 k誸 giao." //		"????%s????????"
#define		MSG_CHAT_FRIEND_HAD_IN		"%s  頲 nh薾 l祄 b糿g h鱱." //	"%s???????????"
#define		MSG_CHAT_GET_FRIEND_APPLY	"%s xin ph衟 gia nh藀 b籲g h鱱" //		"%s???????????"
#define		MSG_CHAT_REFUSE_FRIEND		"%s t?ch鑙 y猽 c莡 k誸 b筺" //		"%s???????????"
#define		MSG_CHAT_ADD_FRIEND_FAIL		"Th猰 %s v祇 danh s竎h b籲g h鱱 th蕋 b筰" // "????%s?????????"
#define		MSG_CHAT_ADD_FRIEND_SUCCESS	"Th猰 %s v祇 danh s竎h b籲g h鱱 th祅h c玭g" //		"????%s????????"
#define		MSG_CHAT_CREATE_TEAM_FAIL1		"?????????????"
#define		MSG_CHAT_CREATE_TEAM_FAIL2		"??????????"
#define		MSG_CHAT_CREATE_TEAM_FAIL3		"?????????????"
#define		MSG_CHAT_RENAME_TEAM_FAIL		"???????????"
#define		MSG_CHAT_DELETE_TEAM_FAIL1		"?????????"
#define		MSG_CHAT_DELETE_TEAM_FAIL2		"??????????????"
#define		MSG_CHAT_FRIEND_ONLINE		"H秓 h鱱 %s l猲 m筺g r錳!" //		"%s???????"
#define		MSG_CHAT_FRIEND_OFFLINE		"H秓 h鱱 %s r阨 m筺g r錳!" //		"%s???????"
#define		MSG_CHAT_DELETE_FRIEND		"Removed %s from your friends list."
#define		MSG_CHAT_DELETED_FRIEND		"%s removed you from their friends list."
// #define		MSG_CHAT_ENEMY_ONLINE			"C鮱 nh﹏ %s l猲 m筺g r錳!"
// #define		MSG_CHAT_ENEMY_OFFLINE			"C鮱 nh﹏ %s r阨 m筺g r錳!"
#define		MSG_CHAT_MSG_FROM_FRIEND		"%s?????????"
#define		MSG_CHAT_FRIEND_NOT_NEAR		"%s?????????"
#define		MSG_CHAT_FRIEND_NOT_ONLINE		"%s???????"
#define		MSG_CHAT_TAR_REFUSE_SINGLE_TALK		"%s?????????????"

#define		MSG_SHOP_NO_ROOM		"Kho秐g tr鑞g trong t骾 kh玭g " //				"?????????"
#define		MSG_SHOP_NO_MONEY		"B筺 kh玭g c? ng﹏ lng" //			"???????"
//#define		MSG_SHOP_NO_EXTPOINT			"B筺 kh玭g c? ti襫 ng"
//#define		MSG_SHOP_NO_FUYUAN				"B筺 kh玭g c? ph骳 duy猲"
//#define		MSG_SHOP_NO_REPUTE				"B筺 kh玭g c? danh v鋘g"
//#define		MSG_SHOP_NO_ACCUM				"B筺 kh玭g c? t輈h l騳"
//#define		MSG_SHOP_NO_HONOR				"B筺 kh玭g c? vinh d?
//#define		MSG_SHOP_NO_RESPECT				"B筺 kh玭g c? uy danh"

#define		MSG_NPC_NO_MANA		"N閕 l鵦 kh玭g !" //					"????????"
#define		MSG_NPC_NO_STAMINA		"Th?l鵦 kh玭g !" //			"????????"
#define		MSG_NPC_NO_LIFE			"Sinh l鵦 kh玭g !" //			"????????"
#define		MSG_NPC_DEATH					"%s????????????"


//#define		MSG_NPC_NOT_USE_TOWNPORTAL		"Kh玭g th?s?d鬾g th?a ph??y"
//#define		MSG_NPC_NOT_PAY_FOR_SPEECH		"B筺 b?c蕀 ph竧 ng玭 n %H:%M - %d/%m/%Y"
//#define		MSG_NPC_NOT_USE_SKILL_SILENT	"B筺 kh玭g th?thi tri觧 v?c玭g l骳 n祔"
//#define		MSG_NPC_NOT_USE_SKILL_DISTANCE	"B筺 ng c竎h ti猽 甶觤 qu?xa, trc m総 s?d鬾g v?c玭g n祔 s?kh玭g  hi謚 nghi謒"
//#define		MSG_NPC_NOT_USE_SKILL_WEAPON	"V?kh?m?b筺 產ng s?d鬾g kh玭g ph?h頿 v韎 lo筰 v?c玭g m?b筺 hi謓 產ng s?d鬾g"
//#define		MSG_NPC_NOT_USE_SKILL_HORSE1	"V?c玭g m?b筺 s?d鬾g hi謓 gi?kh玭g th?ci ng鵤"
//#define		MSG_NPC_NOT_USE_SKILL_HORSE2	"V?c玭g m?b筺 s?d鬾g hi謓 gi?c莕 ph秈 ci ng鵤"
//#define		MSG_NPC_RENASCENCE_SOMEONE		"B筺 b?%s h?tr鋘g thng"
//#define		MSG_NPC_RENASCENCE				"B筺  b?tr鋘g thng"

#define		MSG_OBJ_CANNOT_PICKUP		"B筺 kh玭g th?l蕐 v藅 ph萴 c馻 ngi kh竎" //		"??????????????????"
#define		MSG_MONEY_CANNOT_PICKUP	"B筺 kh玭g th?l蕐 ti襫 c馻 ngi kh竎" //		"????????????????"
#define		MSG_OBJ_TOO_FAR		"V藅 ph萴 qu?xa kh玭g th?l蕐" //				"??????????????"
#define		MSG_DEC_MONEY			"B筺 b?m蕋 <color=yellow>%d <color>lng b筩" //			"???????%d???????"
#define		MSG_EARN_MONEY		"B筺 nh薾 頲 <color=yellow>%d <color>lng b筩" //				"???????%d???????"
#define		MSG_DEATH_LOSE_ITEM		"B筺  b?m蕋 <color=blue>%s<color>" //			"??????????%s??"
#define		MSG_ADD_ITEM			"B筺 nh薾 頲 m閠 c竔 <color=yellow>%s<color>" //		"???????%s??"
//#define		MSG_ADD_ITEM_STACK				"B筺 nh薾 頲 %d c竔 <color=blue>%s<color>"
#define		MSG_ITEM_SAME_DETAIL_IN_IMMEDIATE	"Hi謓  c?v藅 ph萴 ng lo筰 r錳" //	"??????????????????????"
//#define		MSG_ITEM_PUT_IN_IMMEDIATE		"Thanh ph輒 t総 kh玭g th?t v祇 v藅 ph萴 n祔!"
#define		MSG_CAN_NOT_VIEW_ITEM			"?????????????????"
#define		MSG_ITEM_DAMAGED		"Trang b?%s  b?h醤g r錳" //			"???????%s????h?????????????"
#define		MSG_ITEM_NEARLY_DAMAGED	"Trang b?%s s緋 h醤g h穣 n th?r蘮  s鯽 ch鯽 l筰" //		"???????%s???????????????????"

//#define		MSG_LOCK_NOT_THROW				"Nh籱 b秓 v?t礽 s秐 cho b筺 V藅 ph萴 n祔 kh玭g 頲 t飝 ?v鴗 b?
//#define		MSG_LOCK_NOT_TRADE				"Nh籱 b秓 v?t礽 s秐 cho b筺 V藅 ph萴 n祔 kh玭g th?giao d辌h"
//#define		MSG_LOCK_NOT_SETPRICE			"Nh籱 b秓 v?t礽 s秐 cho b筺 V藅 ph萴 n祔 kh玭g th?nh gi?

//#define		MSG_BROKEN_CANTREPAIR			"Trang b? h?h醤g ho祅 to祅 kh玭g th?s鯽 ch鱝 b籲g phng ph竝 b譶h thng"

#define		MSG_TRADE_STATE_OPEN			"B筺 hi謓 gi?c?th?giao d辌h" //		"?????????????"
#define		MSG_TRADE_STATE_CLOSE			"B筺 hi謓 gi?kh玭g th?giao d辌h" // "?????????????"
#define		MSG_TRADE_SELF_LOCK			"B筺  kh鉧 ch鴆 n╪g giao d辌h v藅 ph萴, ch?i phng tr?l阨" // 	"??????????????????"
#define		MSG_TRADE_SELF_UNLOCK			"??????????????????"
#define		MSG_TRADE_DEST_LOCK			"Ngi ch琲 %s  kh鉧 ch鴆 n╪g giao d辌h v藅 ph萴" //	"%s????????????????"
#define		MSG_TRADE_DEST_UNLOCK			"%s????????????????"
#define		MSG_TRADE_SUCCESS			"B筺 c飊g v韎 %s giao d辌h th祅h c玭g" //			"????%s????????"
#define		MSG_TRADE_FAIL				"B筺 c飊g v韎 %s giao d辌h th蕋 b筰" //	"????%s????????"
#define		MSG_TRADE_SELF_ROOM_FULL		"Kho秐g tr鑞g trong t骾 c馻 B筺 kh玭g !" // "???i????????"
#define		MSG_TRADE_DEST_ROOM_FULL		"%s kho秐g tr鑞g trong t骾 kh玭g !" // "%s?i????????"
#define		MSG_TRADE_SEND_APPLY			"B筺 g苝 %s xin ph衟 giao d辌h!" // "????%s???????"
#define		MSG_TRADE_GET_APPLY			"%s xin ph衟 c飊g v韎 B筺 giao d辌h!" //	"%s?????????????"
#define		MSG_TRADE_REFUSE_APPLY			"%s c?tuy謙 giao d辌h v韎 B筺!" // "%s????????????"
#define		MSG_TRADE_TASK_ITEM			"???????????????"
//#define		MSG_TRADE_INPUT_MONEY			"цi phng t v祇 s?ti襫 %d lng"

//#define		MSG_SPAR_SEND_APPLY			"B筺 g鰅 l阨 m阨 t?th?v?ngh?n %s"
//#define		MSG_SPAR_GET_APPLY			"Ngi ch琲 %s g鰅 l阨 m阨 t?th?v?ngh?n v韎 b筺"
//#define		MSG_SPAR_REFUSE_APPLY			"Ngi ch琲 %s t?ch鑙 l阨 m阨 t?v?c馻 b筺"
//#define		MSG_SPAR_VICTORY			"B筺  chi課 th緉g trong l莕 t?th?v?ngh?n祔"
//#define		MSG_SPAR_DEFEAT				"T?v?th蕋 b筰, xin ng ng?l遪g"

//#define		MSG_TRADE_FOLKGAME_SEND_APPLY		"B筺 g鰅 l阨 m阨 u  thu藅 n %s"
//#define		MSG_TRADE_FOLKGAME_GET_APPLY		"Ngi ch琲 %s g鰅 l阨 m阨 u  thu藅 n v韎 b筺"
//#define		MSG_TRADEFOLKGAME_SELF_ROOM_FULL	"H祅h trang c馻 b筺 kh玭g  %dx%d ?tr鑞g"
//#define		MSG_TRADEFOLKGAME_DEST_ROOM_FULL	"H祅h trang c馻 %s kh玭g  %dx%d ?tr鑞g"

#define		MSG_PK_NORMAL_FLAG_OPEN		"Tr筺g th竔 PK ?d筺g chi課 u" //			"PK???????"
#define		MSG_PK_NORMAL_FLAG_CLOSE		"PK mode is disabled."
//#define		MSG_PK_NORMAL_FLAG_DS			"Tr筺g th竔 PK ?d筺g th鴆 gi誸 ngi"
//#define		MSG_PK_NORMAL_FLAG_TONGWAR		"Tr筺g th竔 PK ?d筺g th鴆 m?h譶h bang chi課"
//#define		MSG_PK_NORMAL_FLAG_UNKNOWN		"Tr筺g th竔 PK ?d筺g th鴆 ch璦 r?
//#define		MSG_PK_HIGHT_LOCK_NOT_SWITCH		"Hi謓 gi?PK c馻 b筺 >= %d, trc khi PK xin h穣 h駓 b?tr筺g th竔 kh鉧 b秓 hi觤."
#define		MSG_PKSTATE_NOT_OPEN			"PK mode is not available."
#define		MSG_PK_VALUE				"Tr?s?PK hi謓 t筰 l?%d" // "???j??PK???%d??"
#define		MSG_PK_ERROR_1				"B筺 hi謓 gi?產ng ?trong tr筺g th竔 phi chi課 u!" // "?????????????????"
#define		MSG_PK_ERROR_2				"Ngi m韎 kh玭g th?gi誸 th?" // "???????????"
#define		MSG_PK_ERROR_3				"B筺 產ng c飊g v韎 ngi kh竎 trao i ?ki課!" //	"?????????????"
#define		MSG_PK_ERROR_4				"B筺 產ng c飊g v韎 ngi kh竎 gi誸 th?" //	"??????????????"
#define		MSG_PK_ERROR_5				"B筺 kh玭g th?gi誸 ngi m韎!" //	"?????????????"
#define		MSG_PK_ERROR_6				"цi phng 產ng ?trong tr筺g th竔 phi chi課 u!" //	"?????????????????"
#define		MSG_PK_ERROR_7				"цi phng 產ng c飊g v韎 ngi kh竎 gi誸 th?" //	"??????????????"
//#define		MSG_PK_ERROR_8				"B筺 hi謓 gi?kh玭g th?c鮱 s竧!"
//#define		MSG_PK_ERROR_9				"Ngi n祔 產ng trong tr筺g th竔 ng c鮱 s竧"
#define		MSG_PK_ENMITY_SUCCESS_1			"%s c飊g v韎 B筺 ti課 h祅h c鮱 s竧" // "????%s????????????"
#define		MSG_PK_ENMITY_SUCCESS_2			"Sau 10 gi﹜ b総 u ti課 h祅h c鮱 s竧" // s"10?????????'????"
//#define		MSG_PK_SPAR_ENMITY_SUCCESS_1		"%s c飊g v韎 B筺 ti課 h祅h t?v?
//#define		MSG_PK_SPAR_ENMITY_SUCCESS_2		"Sau 5 gi﹜ b総 u ti課 h祅h t?v?
#define		MSG_PK_ENMITY_CLOSE			"Tr筺g th竔 c鮱 s竧 k誸 th骳" //				"???????????????"
//#define		MSG_PK_SPAR_ENMITY_CLOSE		"Tr筺g th竔 t?v?k誸 th骳"
#define		MSG_PK_ENMITY_OPEN			"B総 u ti課 h祅h c鮱 s竧" //	"????????'????"
#define		MSG_TONG_CREATE_ERROR01		"Invalid guild name."
#define		MSG_TONG_CREATE_ERROR02		"Invalid guild alignment."
#define		MSG_TONG_CREATE_ERROR03		"Th祅h vi猲 bang h閕 kh玭g th?kh玭g th?l藀 m閠 bang h閕 kh竎!" //	"??????????????????"
#define		MSG_TONG_CREATE_ERROR04		"B筺 kh玭g ph秈 l?s竧 th?kh玭g th?l藀 bang!" //	"????????????"
#define		MSG_TONG_CREATE_ERROR05		"B筺 kh玭g  %d c蕄 kh玭g th?l藀 bang!" //	"???????j????????"
#define		MSG_TONG_CREATE_ERROR06		"B筺 kh玭g  %d ng c蕄 th鑞g so竔!" //	"???????????????????"
#define		MSG_TONG_CREATE_ERROR07		"B筺 kh玭g  %d ng﹏ lng b筩  l藀 bang!" //	"?????????? %d ?????"
#define		MSG_TONG_CREATE_ERROR08		"B筺 產ng trong i ng? kh玭g th?l藀 bang!" //	"????????????????"
#define		MSG_TONG_CREATE_ERROR09		"B筺 kh玭g c?Nh筩 vng ki誱!" //	"?????????"
#define		MSG_TONG_CREATE_ERROR10		"B筺 產ng b薾 ho芻 產ng giao d辌h kh玭g th?l藀 bang" //	"???????????L????????"
#define		MSG_TONG_CREATE_ERROR11		"B筺 kh玭g  %d danh v鋘g" //	"???????????????I????????"
//#define		MSG_TONG_CREATE_ERROR12			"B筺 kh玭g  %d ph骳 duy猲"
//#define		MSG_TONG_CREATE_ERROR13			"S?bang h閕 c馻 server  t gi韎 h筺 kh玭g th?t筼 th猰"
//#define		MSG_TONG_CREATE_ERROR14			"T猲 bang h閕 ho芻 t猲 bang ch?b?l鏸 kh玭g th?t筼"
//#define		MSG_TONG_CREATE_ERROR15			"Bang h閕  t錸 t筰 ho芻 b筺 產ng l?bang ch?c馻 m閠 bang h閕 kh竎"
#define		MSG_TONG_APPLY_CREATE			"Guild creation request sent."
#define		MSG_TONG_CREATE_SUCCESS		"Th祅h l藀 bang h閕 th祅h c玭g" //	"??????????"
//#define		MSG_TONG_SEND_APPLY			"B筺 g鰅 l阨 m阨 gia nh藀 bang h閕 n %s"
//#define		MSG_TONG_REV_APPLY			"%s g鰅 l阨 m阨 gia nh藀 bang h閕 n b筺"
#define		MSG_TONG_APPLY_ADD			"B筺 g鰅 y猽 c莡 xin gia nh藀 bang h閕!" //	"???????????"
//#define		MSG_TONG_APPLY_ADD_SELF_MSG		"Ngi ch琲 %s xin ph衟 gia nh藀 bang h閕"
//#define		MSG_TONG_APPLY_ADD_ERROR		"Ngi ch琲 %s kh玭g  甶襲 ki謓 gia nh藀 bang h閕"
#define		MSG_TONG_APPLY_ADD_ERROR1		"Th祅h vi猲 bang h閕 kh玭g th?gia nh藀 bang h閕 kh竎" // "??????????????????"
#define		MSG_TONG_APPLY_ADD_ERROR2		"B筺 ph秈 l?s竧 th?m韎 c?th?gia nh藀 bang h閕" // "???????????"
#define		MSG_TONG_APPLY_ADD_ERROR3		"B筺 ph秈 r阨 kh醝 t?i m韎 c?th?gia nh藀 bang h閕" // "???????????????"
//#define		MSG_TONG_APPLY_ADD_ERROR4		"B筺 v鮝 ch?ng r阨 kh醝 bang h閕, 產ng trong th阨 gian th?th竎h kh玭g th?g鰅 y猽 c莡"
//#define		MSG_TONG_APPLY_ADD_ERROR5		"Bang h閕 m?b筺 v鮝 xin gia nh藀  ng ch鴆 n╪g chi猽 m? t?
//#define		MSG_TONG_APPLY_ADD_ERROR6		"Bang h閕  ng ch鴆 n╪g chi猽 m? t?
//#define		MSG_TONG_APPLY_ADD_ERROR7		"Ngi n祔 v鮝 r阨 kh醝 bang h閕 ch璦 th?gia nh藀 b﹜ gi?
#define		MSG_TONG_REFUSE_ADD			"Ngi ch琲 %s t?ch鑙 l阨 m阨 gia nh藀 bang h閕" //	"%s???????????"
#define		MSG_TONG_ADD_SUCCESS			"B筺  gia nh藀 bang h閕 th祅h c玭g" // "????????"
#define		MSG_TONG_CANNOT_LEAVE1		"Th祅h vi猲 ch輓h th鴆 kh玭g th?r阨 kh醝 bang" //	"?????????????"
#define		MSG_TONG_CANNOT_LEAVE2		"Trng l穙 kh玭g th?r阨 kh醝 bang" //	"????????????"
#define		MSG_TONG_BE_KICKED			"B筺 b?tr鬰 xu蕋 ra kh醝 bang" //	"??????????"
//#define		MSG_TONG_KICK_ERROR1			"Thao t竎 phi ph竝, b筺 kh玭g thu閏 b蕋 k?bang h閕 n祇"
//#define		MSG_TONG_KICK_ERROR2			"Thao t竎 th蕋 b筰, ch璫 Trng l穙 tr?l猲 m韎 c?th?tr鬰 xu蕋 th祅h vi猲"
//#define		MSG_TONG_KICK_ERROR3			"Trng l穙 kh玭g th?tr鬰 xu蕋 tr鵦 ti誴"
#define		MSG_TONG_LEAVE_SUCCESS			"B筺  r阨 kh醝 bang h閕 th祅h c玭g, c?th?xin gia nh藀 bang h閕 kh竎 sau %d ph髏" // "???????????????"
#define		MSG_TONG_LEAVE_FAIL			"R阨 kh醝 bang h閕 th蕋 b筰" //	"???????????????"
//#define		MSG_TONG_NO_MONEY				"B筺 kh玭g c? ng﹏ lng kh玭g th?t??r阨 kh醝"
#define		MSG_TONG_CHANGE_AS_MASTER		"You are now the guild master."
//#define		MSG_TONG_CHANGE_MASTER_ERROR1	"Chuy觧 v?th蕋 b筰, i phng kh玭g tr鵦 tuy課!"
//#define		MSG_TONG_CHANGE_MASTER_ERROR2	"Chuy觧 v?th蕋 b筰, i phng n╪g l鵦 kh玭g !"
//#define		MSG_TONG_CHANGE_MASTER_ERROR3	"Chuy觧 v?th蕋 b筰, trong bang kh玭g c?ngi n祔!"
#define		MSG_TONG_CHANGE_AS_MEMBER		"B﹜ gi?b筺 tr?th祅h th祅h vi猲 b譶h thng" // "????????????????"
//#define		MSG_TONG_CHANGE_AGNAME_ERROR1	"Ngi ch琲 n祔 hi謓 kh玭g tr鵦 tuy課, thao t竎 th蕋 b筰"
//#define		MSG_TONG_CHANGE_AGNAME_ERROR2	"Ngi ch琲 n祔 kh玭g  t礽 l穘h o, thao t竎 th蕋 b筰"
//#define		MSG_TONG_CHANGE_AGNAME_ERROR3	"Ngi ch琲 n祔 kh玭g t錸 t筰, thao t竎 th蕋 b筰"
//#define		MSG_TONG_CHANGE_CAMP			"Ti課 h祅h thay i phe ph竔 b鎛 bang"
//#define		MSG_TONG_CHANGE_CAMP_ERROR1		"Ch?c?bang ch?m韎 s?d鬾g 頲 ch鴆 n╪g n祔"
//#define		MSG_TONG_CHANGE_CAMP_ERROR2		"Vui l遪g ch鋘 phe ph竔 thay i n"
//#define		MSG_TONG_CHANGE_CAMP_ERROR3		"Ng﹏ kh?kh玭g c? %d lng, kh玭g th?thay i phe ph竔 b鎛 bang"
//#define		MSG_TONG_CHANGE_SAVEJIYU_ERROR	"Ng﹏ kh?kh玭g c? %d lng, kh玭g th?b秓 l璾"

//#define		MSG_CANT_SIT_RIDE				"L骳 ci ng鵤 kh玭g th?thi襫 t鋋"
//#define		MSG_CANT_SWITCH_HORSE_SIT		"B筺 產ng thi襫 t鋋 kh玭g th?l猲 ng鵤"
//#define		MSG_CANT_SWITCH_HORSE			"B筺 qu?m謙 m醝 kh玭g th?li猲 t鬰 l猲 ho芻 xu鑞g ng鵤"
//#define		MSG_CANT_TRADE_BUZY				"Trong l骳 c靑 ng鵤 ho芻 產ng giao d辌h v韎 t?i kh玭g th?b祔 b竛!"

#define		MESSAGE_SYSTEM_ANNOUCE_HEAD		"H?th鑞g" // "????"
//#define		MESSAGE_BROADCAST_ANNOUCE_HEAD	"C玭g b?
//#define		MESSAGE_SYSTEM_ANNOUCE_SKILL		"H?th鑞g k?n╪g"
//#define		MESSAGE_SYSTEM_ANNOUCE_PROTECT		"H?th鑞g b秓 m藅"
//#define		MESSAGE_TEAM_ANNOUCE_HEAD		"Tin i"
//#define		MESSAGE_TONG_ANNOUCE_HEAD		"Tin bang"
//#define		MESSAGE_ROOM_ANNOUCE_HEAD		"Tin ph遪g"

//#define		defTONG_VICEROY_AGNAME		"[Th竔 th骫"
//#define		defTONG_MASTER_AGNAME			"Bang ch?
//#define		defTONG_DIRECTOR_AGNAME		"Trng l穙"
//#define		defTONG_MANAGER_AGNAME		"чi trng"
//#define		defTONG_MEMBER_AGNAME			"е t?

//#define		MSG_TRADE_COUNT					"B筺 ch璦 nh gi?cho b蕋 k?v藅 ph萴 n祇"
//#define		MSG_TRADE_SELLED				"V藅 ph萴 n祔  頲 b竛 ra r錳!"
//#define		MSG_TRADE_CLOSED				"Ngi b祔 b竛  c蕋 甶 r錳"

//#define		MSG_FIGHT_MODE_ERROR1			"Tr筺g th竔 kh玭g 頲 b秓 v?kh玭g th?th鵦 hi謓"
//#define		MSG_FIGHT_MODE_ERROR2			"B筺 trong tr筺g th竔 kh玭g 頲 b秓 v?kh玭g th?th鵦 hi謓"
//#define		MSG_FIGHT_MODE_ERROR3			"%s trong tr筺g th竔 kh玭g 頲 b秓 v?kh玭g th?th鵦 hi謓"

//#define		MSG_SUBWORLD_NOT_OPEN			"Л阯g 甶 ph輆 trc kh玭g th玭g"

//#define		MSG_PASSWORD_ERROR1				"M藅 kh萿 ph秈 c? d礽 t?4 n 16 k?t?
//#define		MSG_PASSWORD_ERROR2				"M藅 kh萿 x竎 nh薾 kh玭g tr飊g kh韕. Xin m阨 nh藀 l筰"
//#define		MSG_PASSWORD_ERROR3				"M藅 kh萿 m韎 nh藀 v祇 kh玭g th?tr飊g v韎 m藅 kh萿 hi謓 t筰"

//#define		MSG_FUNCTION_FOBIDDENED			"Xin l鏸, c玭g n╪g n祔 t筸 th阨  b?ng!"
//#define		MSG_FUNCTION_LOCKED				"Thao t竎  b?kh鉧! vui l遪g m?kh鉧 b秓 v?trc khi th鵦 hi謓."


enum enumMSG_ID
{
	enumMSG_ID_NONE = 0,
	enumMSG_ID_TEAM_KICK_One,
	enumMSG_ID_TEAM_DISMISS,
	enumMSG_ID_TEAM_LEAVE,
	enumMSG_ID_TEAM_REFUSE_INVITE,
	enumMSG_ID_TEAM_SELF_ADD,
	enumMSG_ID_TEAM_CHANGE_CAPTAIN_FAIL,
	enumMSG_ID_TEAM_CHANGE_CAPTAIN_FAIL2,
	enumMSG_ID_OBJ_CANNOT_PICKUP,
	enumMSG_ID_OBJ_TOO_FAR,
	enumMSG_ID_DEC_MONEY,
	enumMSG_ID_TRADE_SELF_ROOM_FULL,
	enumMSG_ID_TRADE_DEST_ROOM_FULL,
	enumMSG_ID_TRADE_REFUSE_APPLY,
	enumMSG_ID_TRADE_TASK_ITEM,
	enumMSG_ID_GET_ITEM,
	enumMSG_ID_ITEM_DAMAGED,
	enumMSG_ID_MONEY_CANNOT_PICKUP,
	enumMSG_ID_CANNOT_ADD_TEAM,
	enumMSG_ID_TARGET_CANNOT_ADD_TEAM,
	enumMSG_ID_PK_ERROR_1,
	enumMSG_ID_PK_ERROR_2,
	enumMSG_ID_PK_ERROR_3,
	enumMSG_ID_PK_ERROR_4,
	enumMSG_ID_PK_ERROR_5,
	enumMSG_ID_PK_ERROR_6,
	enumMSG_ID_PK_ERROR_7,
	enumMSG_ID_DEATH_LOSE_ITEM,
	enumMSG_ID_TONG_REFUSE_ADD,
	enumMSG_ID_TONG_BE_KICK,
	enumMSG_ID_TONG_LEAVE_SUCCESS,
	enumMSG_ID_TONG_LEAVE_FAIL,
	enumMSG_ID_TONG_CHANGE_AS_MASTER,
	enumMSG_ID_TONG_CHANGE_AS_MEMBER,
	enumMSG_ID_NUM,
};

//---------------------------- ????????? ------------------------------
#define		MOUSE_CURSOR_NORMAL				0
#define		MOUSE_CURSOR_FIGHT				1
#define		MOUSE_CURSOR_DIALOG				2
#define		MOUSE_CURSOR_PICK				3
#define		MOUSE_CURSOR_USE				8
//#define		MOUSE_CURSOR_TRADE				11
//#define		MOUSE_CURSOR_FINGER				12
//#define		MOUSE_CURSOR_HELP				13
#endif
