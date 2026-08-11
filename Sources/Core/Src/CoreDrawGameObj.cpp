#include "KCore.h"
#include "KNpc.h"
#include "KMissle.h"
#include "KItem.h"
#include "KBuySell.h"
#include "KPlayer.h"
#include "../../Represent/iRepresent/iRepresentshell.h"
#include "KSubWorldSet.h"
#include "scene/KScenePlaceC.h"
#include "ImgRef.h"
#include "GameDataDef.h"
#include "KObjSet.h"
#include "../../Common/FPS60Trace.h"

#define  PHYSICSSKILLICON "\\spr\\Ui\\???????\\icon_sk_ty_ap.spr"

#define SHOW_SPACE_HEIGHT 5
#define NORMAL_FONTSIZE 12

#ifndef _SERVER
static unsigned int g_uNpcRenderFrameSerial = 1;
static unsigned int g_uNpcRenderFrameStamp[MAX_NPC] = { 0 };
static int g_nNpcFrameRenderX[MAX_NPC] = { 0 };
static int g_nNpcFrameRenderY[MAX_NPC] = { 0 };

void CoreBeginNpcRenderFrame()
{
	++g_uNpcRenderFrameSerial;
	if (g_uNpcRenderFrameSerial == 0)
	{
		memset(g_uNpcRenderFrameStamp, 0, sizeof(g_uNpcRenderFrameStamp));
		g_uNpcRenderFrameSerial = 1;
	}
}
#endif

void	CoreDrawGameObj(unsigned int uObjGenre, unsigned int uId, int x, int y, int Width, int Height, int nParam)
{
	//	static int nSpeed = 0;
	switch (uObjGenre)
	{
	case CGOG_NPC:
		if (uId > 0 && uId < MAX_NPC)
		{
			// FPS60 reference: local body and camera share one coordinate.
			if ((int)uId == Player[CLIENT_PLAYER_INDEX].m_nIndex)
			{
				int nFocusX = 0, nFocusY = 0;
				if (g_ScenePlace.GetCurrentPaintFocus(nFocusX, nFocusY))
				{
					x = nFocusX;
					y = nFocusY + POINT_LEAF_Y_ADJUST_VALUE;
				}
			}
			if ((nParam & IPOT_RL_OBJECT) == IPOT_RL_OBJECT ||
				g_uNpcRenderFrameStamp[uId] != g_uNpcRenderFrameSerial)
			{
				g_nNpcFrameRenderX[uId] = x;
				g_nNpcFrameRenderY[uId] = y;
				g_uNpcRenderFrameStamp[uId] = g_uNpcRenderFrameSerial;
			}
			x = g_nNpcFrameRenderX[uId];
			y = g_nNpcFrameRenderY[uId];
			// Body and overhead layers are traversed independently. Publish the
			// exact cached position before either layer paints so name/life/chat do
			// not read the body's position from the preceding render frame.
			Npc[uId].SetRenderPos(x, y);
			if ((nParam & IPOT_RL_INFRONTOF_ALL) == IPOT_RL_INFRONTOF_ALL)
			{
				int nHeight = Npc[uId].GetNpcPate();

				Npc[uId].PaintBlood(nHeight / 2);	//?

				int nnHeight = nHeight;
				nHeight = Npc[uId].PaintChat(nnHeight);	//???????????????

														// Target information is painted once in KPlayer::DrawSelectInfo().
														// Skipping it here prevents duplicate names/life bars and also keeps
														// hover rendering independent from the F7/F8 display switches.
				const bool bTargetNpc =
					(Player[CLIENT_PLAYER_INDEX].GetTargetNpc() == (int)uId);

				if (!bTargetNpc)
				{
					if (nHeight == nnHeight)
					{
						if (NpcSet.CheckShowLife())
						{
							if (Npc[uId].m_Kind == kind_normal ||
								Npc[uId].m_Kind == kind_player ||
								Npc[uId].m_Kind == kind_partner)
							{
								nHeight = Npc[uId].PaintLife(nnHeight, true);
							}
						}

						if (NpcSet.CheckShowName())
						{
							if (nnHeight != nHeight)
								nHeight += SHOW_SPACE_HEIGHT;

							Npc[uId].PaintInfo(
								nHeight,
								false,
								NORMAL_FONTSIZE,
								0xff000000);
						}
					}
					else if (NpcSet.CheckShowLife() &&
						(Npc[uId].m_Kind == kind_normal ||
							Npc[uId].m_Kind == kind_player ||
							Npc[uId].m_Kind == kind_partner))
					{
						Npc[uId].PaintLife(nnHeight, true);
					}
				}
			}
			else if ((nParam & IPOT_RL_OBJECT) == IPOT_RL_OBJECT)
			{
				Npc[uId].Paint(x, y);
				if ((int)uId == Player[CLIENT_PLAYER_INDEX].GetTargetNpc())
				{
					Npc[uId].DrawBorder();
				}
			}
		}
		break;
	case CGOG_MISSLE:
		if (uId > 0)
			Missle[uId].Paint();
		break;
	case CGOG_ITEM:
		if (uId == 0)
			break;

		if (Width == 0 && Height == 0)
		{
#define	ITEM_CELL_WIDTH		26
#define	ITEM_CELL_HEIGHT	26
			Width = Item[uId].GetWidth() * ITEM_CELL_WIDTH;
			Height = Item[uId].GetHeight() * ITEM_CELL_HEIGHT;
			x -= Width / 2;
			y -= Height / 2;
		}
		else
		{
			x += (Width - Item[uId].GetWidth() * ITEM_CELL_WIDTH) / 2;
			y += (Height - Item[uId].GetHeight() * ITEM_CELL_HEIGHT) / 2;
		}
		Item[uId].Paint(x, y);
		break;
	case CGOG_MENU_NPC:
		if (nParam)
		{
			((KNpcRes*)nParam)->SetPos(0, x + Width / 2, y + Height / 2 + 28, 0, FALSE, TRUE);
#define		STAND_TOTAL_FRAME	15
			int nFrame = g_SubWorldSet.m_nLoopRate % STAND_TOTAL_FRAME;
			((KNpcRes*)nParam)->Draw(0, 0, STAND_TOTAL_FRAME, nFrame, true);
		}
		break;

	case CGOG_NPC_BLUR_DETAIL(1):
		Npc[uId].GetNpcRes()->m_cNpcBlur.Draw(1);
		break;
	case CGOG_NPC_BLUR_DETAIL(2):
		Npc[uId].GetNpcRes()->m_cNpcBlur.Draw(2);
		break;
	case CGOG_NPC_BLUR_DETAIL(3):
		Npc[uId].GetNpcRes()->m_cNpcBlur.Draw(3);
		break;
	case CGOG_NPC_BLUR_DETAIL(4):
		Npc[uId].GetNpcRes()->m_cNpcBlur.Draw(4);
		break;
	case CGOG_NPC_BLUR_DETAIL(5):
		Npc[uId].GetNpcRes()->m_cNpcBlur.Draw(5);
		break;
	case CGOG_NPC_BLUR_DETAIL(6):
		Npc[uId].GetNpcRes()->m_cNpcBlur.Draw(6);
		break;
	case CGOG_NPC_BLUR_DETAIL(7):
		Npc[uId].GetNpcRes()->m_cNpcBlur.Draw(7);
		break;
	case CGOG_SKILL:
	case CGOG_SKILL_FIGHT:
	case CGOG_SKILL_LIVE:
	case CGOG_SKILL_SHORTCUT:
	{
		int nSkillId = (int)uId;
		if (nSkillId > 0)
		{
			ISkill* pSkill = g_SkillManager.GetSkill(nSkillId, 1);
			if (pSkill)
			{
				pSkill->DrawSkillIcon(x, y, Width, Height);
			}
		}
		else
		{
			if (uId == -1)
			{
				KRUImage RUIconImage;
				RUIconImage.nType = ISI_T_SPR;
				RUIconImage.Color.Color_b.a = 255;
				RUIconImage.bRenderStyle = IMAGE_RENDER_STYLE_ALPHA;
				RUIconImage.uImage = 0;
				RUIconImage.nISPosition = IMAGE_IS_POSITION_INIT;
				RUIconImage.bRenderFlag = 0;
				strcpy(RUIconImage.szImage, PHYSICSSKILLICON);
				RUIconImage.oPosition.nX = x;
				RUIconImage.oPosition.nY = y;
				RUIconImage.oPosition.nZ = 0;
				RUIconImage.nFrame = 0;
				g_pRepresent->DrawPrimitives(1, &RUIconImage, RU_T_IMAGE, 1);
			}
		}
	}
	break;
	case CGOG_OBJECT:
		if (uId)
		{
			if ((nParam & IPOT_RL_INFRONTOF_ALL) == IPOT_RL_INFRONTOF_ALL)
			{
				if (ObjSet.CheckShowName())
					Object[uId].DrawInfo();
			}
			else //if ((nParam & IPOT_RL_COVER_GROUND) == IPOT_RL_COVER_GROUND)
			{
				Object[uId].Draw();
				if ((int)uId == Player[CLIENT_PLAYER_INDEX].GetTargetObj())
					Object[uId].DrawBorder();
			}
		}
		break;
	case CGOG_NPCSELLITEM:
		if (uId < 0)
			break;
		BuySell.PaintItem(uId, x, y);
		break;
	default:
		break;
	}
}

void	CoreGetGameObjLightInfo(unsigned int uObjGenre, unsigned int uId, KLightInfo* pLightInfo)
{
	switch (uObjGenre)
	{
	case CGOG_NPC:
		if (uId > 0 && uId < MAX_NPC)
		{
			Npc[uId].GetMpsPos(&pLightInfo->oPosition.nX, &pLightInfo->oPosition.nY);
			pLightInfo->oPosition.nZ = Npc[uId].m_Height;
			pLightInfo->dwColor = 0;
			if (Npc[uId].m_RedLum > 255)
			{
				Npc[uId].m_RedLum = 255;
			}
			if (Npc[uId].m_GreenLum > 255)
			{
				Npc[uId].m_GreenLum = 255;
			}
			if (Npc[uId].m_BlueLum > 255)
			{
				Npc[uId].m_BlueLum = 255;
			}
			pLightInfo->dwColor = 0xff000000 | Npc[uId].m_RedLum << 16 | Npc[uId].m_GreenLum << 8 | Npc[uId].m_BlueLum;
			pLightInfo->nRadius = Npc[uId].m_CurrentVisionRadius;
		}
		break;
	case CGOG_OBJECT:
		break;
	case CGOG_MISSLE:
		if (uId > 0 && uId < MAX_MISSLE)
		{
			if (Missle[uId].m_nMissleId > 0)
			{
				Missle[uId].GetLightInfo(pLightInfo);
			}
		}
		break;
	default:
		break;
	}
}
