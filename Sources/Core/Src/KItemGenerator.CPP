//---------------------------------------------------------------------------
// Sword3 Core (c) 2002 by Kingsoft
//
// File:	KItemGenerator.CPP
// Date:	2002.08.26
// Code:	DongBo
// Desc:    CPP file. 本文件实现的类用于生成道具
//---------------------------------------------------------------------------
#include "KEngine.h"
#include "KCore.h"
#include "MyAssert.H"
#include "KItem.h"
#include "KSubWorldSet.h"
#include "KItemGenerator.h"

KItemGenerator	ItemGen;			//	装备生成器

KItemGenerator::KItemGenerator()
{
}

KItemGenerator::~KItemGenerator()
{
}

/******************************************************************************
	功能：	数据初始化. 从tab file中读取数据
******************************************************************************/
BOOL KItemGenerator::Init()
{
	if (!m_BPTLib.Init())		// 此调用从若干的tab file中载入所有的初始属性
		return FALSE;

	for (int i = equip_meleeweapon; i <= equip_mask; i++)
	{
		switch(i)
		{
		case equip_meleeweapon:
			m_EquipNumOfEntries[i] = m_BPTLib.GetMeleeWeaponRecordNumber();
			break;
		case equip_rangeweapon:
			m_EquipNumOfEntries[i] = m_BPTLib.GetRangeWeaponRecordNumber();
			break;
		case equip_armor:
			m_EquipNumOfEntries[i] = m_BPTLib.GetArmorRecordNumber();
			break;
		case equip_helm:
			m_EquipNumOfEntries[i] = m_BPTLib.GetHelmRecordNumber();
			break;
		case equip_boots:
			m_EquipNumOfEntries[i] = m_BPTLib.GetBootRecordNumber();
			break;
		case equip_belt:
			m_EquipNumOfEntries[i] = m_BPTLib.GetBeltRecordNumber();
			break;
		case equip_cuff:
			m_EquipNumOfEntries[i] = m_BPTLib.GetCuffRecordNumber();
			break;
		case equip_amulet:
			m_EquipNumOfEntries[i] = m_BPTLib.GetAmuletRecordNumber();
			break;
		case equip_ring:
			m_EquipNumOfEntries[i] = m_BPTLib.GetRingRecordNumber();
			break;
		case equip_pendant:
			m_EquipNumOfEntries[i] = m_BPTLib.GetPendantRecordNumber();
			break;
		case equip_horse:
			m_EquipNumOfEntries[i] = m_BPTLib.GetHorseRecordNumber();
			break;
		case equip_mask:
			m_EquipNumOfEntries[i] = m_BPTLib.GetMaskRecordNumber();
			break;
		}
	}
	m_MedNumOfEntries = m_BPTLib.GetMedicineRecordNumber();
	return TRUE;

}

/******************************************************************************
	功能：	生成药品
	入口:	nDetailType: 药品类型
			nLevel: 等级
			nVersion: 版本号
	出口:	成功时返回非零, 相关数据在 pItem 所指对象中给出
			失败时返回零
******************************************************************************/
BOOL KItemGenerator::Gen_Medicine(IN int nDetailType,
								  IN int nLevel,
								  IN OUT KItem* pItem)
{
	_ASSERT(this != NULL);
	_ASSERT(pItem != NULL);

	BOOL bEC = FALSE;
	
	const int i = nDetailType * 5 + nLevel - 1;	// 本公式由策划定义
												// 等级数据从1开始，所以要减回来
	const KBASICPROP_MEDICINE* pMed = NULL;
	pMed = m_BPTLib.GetMedicineRecord(i);
	if (NULL == pMed)
	{
		_ASSERT(FALSE);
		return bEC;
	}
	*pItem = *pMed;
	return TRUE;
}
/******************************************************************************
T筼 item ho祅g kim
Creator: Guve
******************************************************************************/
BOOL KItemGenerator::Gen_GoldEquip(IN int nLuck, IN int nRowId, IN OUT KItem* pItem, IN int* pnaryMALevel)
{
	if(nRowId <= 0)
		return FALSE;
	const KBASICPROP_EQUIPMENT_GOLD* pEqu = m_BPTLib.GetGoldItemRecord(nRowId-1);
	if(!pEqu)
		return FALSE;
	pItem->SetExType(extype_gold);
	pItem->SetGenParam(nRowId);
	pItem->SetAttrib_CBR((KBASICPROP_EQUIPMENT*)pEqu);
	pItem->SetAttrib_Extend(pEqu);
	KItemNormalAttrib	sMA[6];	// thu閏 t輓h s?thu th藀 頲
	KItemNormalAttrib	sMAEx[2];	// thu閏 t輓h s?thu th藀 頲
	int nMA = 0;
	if(!pnaryMALevel)
	{
#ifdef _SERVER
		if(nLuck < 0)
			nLuck = 0;
		for(int i=0;i<6;++i)
		{
			const MAATTRIB_GOLDEQUIP* pMaGe = m_BPTLib.GetGoldMagicRecord(pEqu->m_aryMagicId[i] - 1);
			if(!pMaGe)
				continue;
			sMA[nMA].nAttribType = pMaGe->m_GoldMA.nPropKind;
			sMA[nMA].nValue[1] = -1;
			sMA[nMA].nValue[2] = pMaGe->m_GoldMA.aryRange[2].nMin;
			int nDist = pMaGe->m_GoldMA.aryRange[0].nMax - pMaGe->m_GoldMA.aryRange[0].nMin;
			int nCalcLuck = nLuck;
			if(nDist <= 0)
			{
				sMA[nMA].nValue[0] = pMaGe->m_GoldMA.aryRange[0].nMin;
			}
			else if(nCalcLuck >= 200)
			{
				sMA[nMA].nValue[0] = pMaGe->m_GoldMA.aryRange[0].nMax;
			}
			else
			{
				if(nCalcLuck > 100)
					nCalcLuck = 100;
				int nMid = nDist/2+1;
				if(nDist < 10)
				{
					if(g_Random(100 - nCalcLuck) < 20)
					{
						nMid = GetRandomNumber(nMid*10, nDist*10+5)/10;
					}
					else
					{
						nMid = g_Random(nMid*10)/10;
					}
					sMA[nMA].nValue[0] = pMaGe->m_GoldMA.aryRange[0].nMin + nMid;
				}
				else
				{
					if(g_Random(100 - nCalcLuck) < 20)
					{
						sMA[nMA].nValue[0] = pMaGe->m_GoldMA.aryRange[0].nMin + 
										+ GetRandomNumber(nMid, nDist);
					}
					else
					{
						sMA[nMA].nValue[0] = pMaGe->m_GoldMA.aryRange[0].nMin + g_Random(nMid);
					}
				}
			}
			++nMA;
		}
		nMA = 0;
		for(i=0;i<2;++i)
		{
			const MAATTRIB_GOLDEQUIP* pMaGe = m_BPTLib.GetGoldMagicRecord(pEqu->m_aryMagicEx[i] - 1);
			if(!pMaGe)
				continue;
			sMAEx[nMA].nAttribType = pMaGe->m_GoldMA.nPropKind;
			sMAEx[nMA].nValue[1] = -1;
			sMAEx[nMA].nValue[2] = pMaGe->m_GoldMA.aryRange[2].nMin;
			int nDist = pMaGe->m_GoldMA.aryRange[0].nMax - pMaGe->m_GoldMA.aryRange[0].nMin;
			int nCalcLuck = nLuck;
			if(nDist <= 0)
			{
				sMAEx[nMA].nValue[0] = pMaGe->m_GoldMA.aryRange[0].nMin;
			}
			else if(nCalcLuck >= 200)
			{
				sMAEx[nMA].nValue[0] = pMaGe->m_GoldMA.aryRange[0].nMax;
			}
			else
			{
				if(nCalcLuck > 100)
					nCalcLuck = 100;
				int nMid = nDist/2+1;
				if(nDist < 10)
				{
					if(g_Random(100 - nCalcLuck) < 20)
					{
						nMid = GetRandomNumber(nMid*10, nDist*10+5)/10;
					}
					else
					{
						nMid = g_Random(nMid*10)/10;
					}
					sMAEx[nMA].nValue[0] = pMaGe->m_GoldMA.aryRange[0].nMin + nMid;
				}
				else
				{
					if(g_Random(100 - nCalcLuck) < 20)
					{
						sMAEx[nMA].nValue[0] = pMaGe->m_GoldMA.aryRange[0].nMin + 
										+ GetRandomNumber(nMid, nDist);
					}
					else
					{
						sMAEx[nMA].nValue[0] = pMaGe->m_GoldMA.aryRange[0].nMin + g_Random(nMid);
					}
				}
			}
			++nMA;
		}
#endif
	}
	else
	{
		for(int i=0;i<6;++i)
		{
			const MAATTRIB_GOLDEQUIP* pMaGe = m_BPTLib.GetGoldMagicRecord(pEqu->m_aryMagicId[i] - 1);
			if(!pMaGe)
				continue;
			if(!pnaryMALevel[nMA*2])
				break;
			sMA[nMA].nAttribType = pnaryMALevel[nMA*2];
			sMA[nMA].nValue[0] = pnaryMALevel[nMA*2+1];
			sMA[nMA].nValue[1] = -1;
			sMA[nMA].nValue[2] = pMaGe->m_GoldMA.aryRange[2].nMin;
			++nMA;
		}
		nMA = 0;
		for(i=0;i<2;++i)
		{
			const MAATTRIB_GOLDEQUIP* pMaGe = m_BPTLib.GetGoldMagicRecord(pEqu->m_aryMagicEx[i] - 1);
			if(!pMaGe)
				continue;
			if(!pnaryMALevel[12+nMA*2])
				break;
			sMAEx[nMA].nAttribType = pnaryMALevel[12+nMA*2];
			sMAEx[nMA].nValue[0] = pnaryMALevel[12+nMA*2+1];
			sMAEx[nMA].nValue[1] = -1;
			sMAEx[nMA].nValue[2] = pMaGe->m_GoldMA.aryRange[2].nMin;
			++nMA;
		}
	}
	pItem->SetAttrib_MA(sMA);
	pItem->SetAttrib_MA(sMAEx, true);
	return TRUE;
}

const KBASICPROP_EQUIPMENT_GOLD* KItemGenerator::GetGoldItemRecord(IN int nIndex)
{
	return m_BPTLib.GetGoldItemRecord(nIndex);
}

int KItemGenerator::GetGoldItemNumber()
{
	return m_BPTLib.GetGoldItemNumber();
}
/******************************************************************************
T筼 item tr緉g, xanh
Editor: Guve
******************************************************************************/
BOOL KItemGenerator::Gen_Equipment(IN int nDetailType,
								   IN int nParticularType,
								   IN int nSeriesReq,
								   IN int nLevel,
								   IN const int* pnaryMALevel,
								   IN int nLucky,
								   IN OUT KItem* pItem)
{
	_ASSERT(this != NULL);
	_ASSERT(pItem != NULL);

	BOOL bEC = FALSE;
	// i l?d遪g th?trong c竎 file item.txt
	int i = nParticularType * 10 + nLevel - 1;

	const KBASICPROP_EQUIPMENT* pEqu = NULL;
	switch(nDetailType)
	{
	case equip_meleeweapon:
		pEqu = m_BPTLib.GetMeleeWeaponRecord(i);
		break;
	case equip_rangeweapon:
		pEqu = m_BPTLib.GetRangeWeaponRecord(i);
		break;
	case equip_armor:
		pEqu = m_BPTLib.GetArmorRecord(i);
		break;
	case equip_helm:
		pEqu = m_BPTLib.GetHelmRecord(i);
		break;
	case equip_boots:
		pEqu = m_BPTLib.GetBootRecord(i);
		break;
	case equip_belt:
		pEqu = m_BPTLib.GetBeltRecord(i);
		break;
	case equip_amulet:
		pEqu = m_BPTLib.GetAmuletRecord(i);
		break;
	case equip_ring:
		pEqu = m_BPTLib.GetRingRecord(i);
		break;
	case equip_cuff:
		pEqu = m_BPTLib.GetCuffRecord(i);
		break;
	case equip_pendant:
		pEqu = m_BPTLib.GetPendantRecord(i);
		break;
	case equip_horse:
		pEqu = m_BPTLib.GetHorseRecord(i);
		break;
	case equip_mask:
		pEqu = m_BPTLib.GetMaskRecord(nParticularType);
		break;
	default:
		break;
	}
	if (NULL == pEqu)
		{ _ASSERT(FALSE); return bEC; }
	// l蕐 頲 d遪g trong item.txt -> set thu閏 t輓h tr緉g c?b秐
	pItem->SetAttrib_CBR(pEqu);
	if(nDetailType == equip_mask)
	{
		if(nLevel > 0)
			pItem->SetLevel(nLevel);
		else
			pItem->SetLevel(0);
	}
	else
		pItem->SetSeries(nSeriesReq);
	
	if (NULL == pnaryMALevel || nDetailType >= equip_horse) //item tr緉g, kh玭g magic
		return TRUE;
	// b総 u t筼 magic
	KItemNormalAttrib	sMA[6];	// thu閏 t輓h s?thu th藀 頲
#ifndef _SERVER	//?client ch?c藀 nh藅
	bEC = TRUE;
	for(i=0;i<6;++i)
	{
		if(!pnaryMALevel[i*2])
			break;
		sMA[i].nAttribType = pnaryMALevel[i*2];
		sMA[i].nValue[0] = pnaryMALevel[i*2+1];
		sMA[i].nValue[1] = -1;
		if(sMA[i].nAttribType == magic_addphysicsdamage_p)
			sMA[i].nValue[2] = 6;
	}
#else	//?server c莕 t筼 m韎
	bEC = Gen_MagicAttrib(nDetailType, pnaryMALevel, nSeriesReq, nLucky, sMA);
#endif
	if (bEC)
		pItem->SetAttrib_MA(sMA);

	return bEC;
}

/******************************************************************************
T筼 item t輒 huy襫 tinh
Editor: Guve
******************************************************************************/
BOOL KItemGenerator::Gen_PurpleEquip(IN int nDetailType,
								   IN int nParticularType,
								   IN int nSeriesReq,
								   IN int nLevel,
								   IN const int* pnaryMALevel,
								   IN int nRows,
								   IN OUT KItem* pItem)
{
	_ASSERT(this != NULL);
	_ASSERT(pItem != NULL);

	BOOL bEC = FALSE;
	// i l?d遪g th?trong c竎 file item.txt
	int i = nParticularType * 10 + nLevel - 1;

	const KBASICPROP_EQUIPMENT* pEqu = NULL;
	switch(nDetailType)
	{
	case equip_meleeweapon:
		pEqu = m_BPTLib.GetMeleeWeaponRecord(i);
		break;
	case equip_rangeweapon:
		pEqu = m_BPTLib.GetRangeWeaponRecord(i);
		break;
	case equip_armor:
		pEqu = m_BPTLib.GetArmorRecord(i);
		break;
	case equip_helm:
		pEqu = m_BPTLib.GetHelmRecord(i);
		break;
	case equip_boots:
		pEqu = m_BPTLib.GetBootRecord(i);
		break;
	case equip_belt:
		pEqu = m_BPTLib.GetBeltRecord(i);
		break;
	case equip_amulet:
		pEqu = m_BPTLib.GetAmuletRecord(i);
		break;
	case equip_ring:
		pEqu = m_BPTLib.GetRingRecord(i);
		break;
	case equip_cuff:
		pEqu = m_BPTLib.GetCuffRecord(i);
		break;
	case equip_pendant:
		pEqu = m_BPTLib.GetPendantRecord(i);
		break;
	case equip_horse:
		pEqu = m_BPTLib.GetHorseRecord(i);
		break;
	case equip_mask:
		pEqu = m_BPTLib.GetMaskRecord(nParticularType);
		break;
	default:
		break;
	}
	if (NULL == pEqu)
		{ _ASSERT(FALSE); return bEC; }
	// l蕐 頲 d遪g trong item.txt -> set thu閏 t輓h tr緉g c?b秐
	pItem->SetExType(extype_purple);
	if(nRows <= 0 || nRows > 6)
		nRows = 6;
	pItem->SetGenParam(nRows);
	pItem->SetAttrib_CBR(pEqu);
	if(nDetailType == equip_mask)
	{
		if(nLevel > 0)
			pItem->SetLevel(nLevel);
		else
			pItem->SetLevel(0);
	}
	else
		pItem->SetSeries(nSeriesReq);
	
	if (NULL == pnaryMALevel) //item tr緉g, kh玭g magic
		return TRUE;
	bEC = TRUE;
	// b総 u t筼 magic
	KItemNormalAttrib	sMA[6];	// thu閏 t輓h s?thu th藀 頲
	for(i=0;i<6;++i)
	{
		if(!pnaryMALevel[i*2])
			break;
		sMA[i].nAttribType = pnaryMALevel[i*2];
		sMA[i].nValue[0] = pnaryMALevel[i*2+1];
		sMA[i].nValue[1] = -1;
		if(sMA[i].nAttribType == magic_addphysicsdamage_p)
			sMA[i].nValue[2] = 6;
	}
	pItem->SetAttrib_MA(sMA);

	return bEC;
}

#define MAX_LUCKRAND	100000
// Ch鋘 6 d遪g thu閏 t輓h
BOOL KItemGenerator::Gen_MagicAttrib(
    int nType, const int* pnaryMALevel, int nSeriesReq, int nLucky, KItemNormalAttrib* pnaryMA)
{
    int nResult = false;
    KBPT_ClassMAIT  SelectedMagicTable;	
	// n琲 l璾 6 d遪g  set m_nUseFlag
    KMAGICATTRIB_TABFILE *pMagicAttrTable[6] = { NULL, NULL, NULL, NULL, NULL, NULL };

    int i = 0;
	double dLucky = 1.0-(double)nLucky/100.0;
	if(dLucky < 0.0)
		dLucky = 0.0;
    _ASSERT(pnaryMALevel);
    _ASSERT(pnaryMA);

    for (i = 0; i < 6; i++) 
    {
        // g苝 level u v祇 = 0 th?ng璶g
        if (pnaryMALevel[i] == 0)	
        	break;

        SelectedMagicTable.Clear();

        // l蕐 d遪g trong file magicattrib.txt
        const KBPT_ClassMAIT *pCMITItem = m_BPTLib.GetCMIT(
            1 - (i & 1),        // 萵 = 0, hi謓 = 1
            nType,              // 0->9: lo筰 trang b?EQUIPDETAILTYPE
            nSeriesReq,         // 0->4: ng?h祅h 
            pnaryMALevel[i]     // level c馻 thu閏 t輓h
        );

        _ASSERT(pCMITItem);
        if (!pCMITItem)
        {
            g_DebugLog(
                "[GenMagicAttrib] GetCMIT Error, nPrefixPostfix = %d, nType = %d, nSeries = %d, nLevel = %d", 
                1 - (i & 1), nType, nSeriesReq, pnaryMALevel[i]
            );
            break;
        }

        // s?lng thu閏 t輓h c馻 level n祔
        int nCMITItemCount = pCMITItem->GetCount();
        int j = 0;
		int nDecide = MAX_LUCKRAND - GetRandomNumber(0, MAX_LUCKRAND);
        nDecide += (int)(dLucky*nDecide); //0->100000 + 0->100000*(100-lucky)/100

        for (j = 0; j < nCMITItemCount; j++)
        {
            // l蕐 d遪g thu閏 t輓h c?th?
            int nMAIndex = pCMITItem->Get(j);
            KMAGICATTRIB_TABFILE *pMAItem = (KMAGICATTRIB_TABFILE *)m_BPTLib.GetMARecord(nMAIndex);
            if (!pMAItem)
            {
                _ASSERT(pMAItem);
                continue;
            }

            //  tr飊g l苝 trong 6 d遪g
            if (pMAItem->m_nUseFlag)
                continue;

            // s?random > gi?tr?may m緉 => kh玭g ch鋘
            if ((pMAItem->m_DropRate[nType]) <= nDecide)
                continue;
            
            // ki觤 tra tr飊g l苝 id thu閏 t輓h
            int k = 0;
            for (k = 0; k < i; k++)
            {
                _ASSERT(pMagicAttrTable[k]);

                if ((pMagicAttrTable[k]->m_MagicAttrib.nPropKind) == (pMAItem->m_MagicAttrib.nPropKind))
                    break;
            }

            //  tr飊g l苝
            if (k < i)
                continue;
			//ch鋘 頲 thu閏 t輓h
            SelectedMagicTable.Insert(nMAIndex);
        }

        int nSelectedCount = SelectedMagicTable.GetCount();

        if (nSelectedCount == 0)
        {
            // kh玭g ch鋘 頲 thu閏 t輓h n祇
            break;
        }
        
        // l蕐 ng蓇 nhi猲 1 thu閏 t輓h trong c竎 thu閏 t輓h  ch鋘 頲
        int nLuckyItemIndex = GetRandomNumber(0, nSelectedCount - 1);
        KMAGICATTRIB_TABFILE *pMAItem = (KMAGICATTRIB_TABFILE *)m_BPTLib.GetMARecord(
             SelectedMagicTable.Get(nLuckyItemIndex)
        );

        // l璾 t筸 th阨  set m_nUseFlag
        pMagicAttrTable[i] = pMAItem;

        _ASSERT(pMAItem);
        _ASSERT(!(pMAItem->m_nUseFlag));

        // set  s?d鬾g thu閏 t輓h n祔
        pMAItem->m_nUseFlag = true;
		
        pnaryMA[i].nAttribType = pMAItem->m_MagicAttrib.nPropKind;
        pnaryMA[i].nValue[0] = GetRandomNumber(
            pMAItem->m_MagicAttrib.aryRange[0].nMin, 
            pMAItem->m_MagicAttrib.aryRange[0].nMax
        );
        pnaryMA[i].nValue[1] = GetRandomNumber(
            pMAItem->m_MagicAttrib.aryRange[1].nMin, 
            pMAItem->m_MagicAttrib.aryRange[1].nMax
        );
        pnaryMA[i].nValue[2] = GetRandomNumber(
            pMAItem->m_MagicAttrib.aryRange[2].nMin, 
            pMAItem->m_MagicAttrib.aryRange[2].nMax
        );
		/*g_DebugLog(
			"[GenMagicAttrib] pnaryMA[%d]: (%d:%s), nAttribType = %d, nValue[0] = %d, nValue[1] = %d, nValue[2] = %d,", 
			i,
			SelectedMagicTable.Get(nLuckyItemIndex),
			pMAItem->m_szName,
			pnaryMA[i].nAttribType,
			pnaryMA[i].nValue[0],
			pnaryMA[i].nValue[1],
			pnaryMA[i].nValue[2]
		);*/
    }
	//kh玭g c莕 clear c竎 d遪g cu鑙 s鉻 l筰, v?KItemNormalAttrib khi kh雐 t筼  l?0
   /* for (NULL; i < 6; i++)
    {
        pnaryMA[i].nAttribType = 0;
        pnaryMA[i].nValue[0] = 0;
        pnaryMA[i].nValue[1] = 0;
        pnaryMA[i].nValue[2] = 0;
    }*/

    for (i = 0; i < 6; i++)
    {
        if (!pMagicAttrTable[i])
            break;

        _ASSERT(pMagicAttrTable[i]->m_nUseFlag);

        pMagicAttrTable[i]->m_nUseFlag = false;    // t l筰 ch璦 s?d鬾g thu閏 t輓h cho l莕 sau
    }

    nResult = true;
//Exit0:
	return nResult;
}

// Following Code is implement by DongBo
//BOOL KItemGenerator::Gen_MagicAttrib(int nType, const int* pnaryMALevel, int nSeriesReq, int nLucky,
//									 KItemNormalAttrib* pnaryMA)
//{
//	
//    // 确定适用于该装备的全部魔法属性及其数量
//	if (FALSE == GMA_GetAvaliableMA(nType))
//		{ _ASSERT(FALSE); return FALSE; }
//
//	// 确定上述各魔法属性的等级,出现概率
//	if (FALSE == GMA_GetLevelAndDropRate(nType))
//		{ _ASSERT(FALSE); return FALSE; }
//
//	// 从上述魔法属性中选出符合条件的. 策划要求选出6个
//	for (int i = 0; i < 6; i++)				// 奇数: 前缀, 偶数: 后缀
//	{
//		GMA_ChooseMA((i&1), pnaryMALevel[i], nLucky, &(pnaryMA[i]));
//		if (pnaryMA[i].nAttribType == 0)
//			break;
//	}
//	return TRUE;
//}

/******************************************************************************
	功能:	确定适用于指定装备的全部魔法属性及其数量
	入口:	nType: 指定装备
	出口:	成功时返回非零. m_GMA_naryMA[0]给出适用于该装备的全部魔法属性前缀
							m_GMA_nCount[0]给出上述魔法属性的总数
							m_GMA_naryMA[1]给出适用于该装备的全部魔法属性后缀
							m_GMA_nCount[1]给出上述魔法属性的总数
			失败时返回零
******************************************************************************/
BOOL KItemGenerator::GMA_GetAvaliableMA(int nType)
{
	//TODO: 可能需要对nType进行转换, 从装备类型值变成 m_BPTLib.m_CMAT 数组的索引
	for (int i = 0; i < 2; i++)		// 0: 前缀, 1: 后缀
	{
		const KBPT_ClassifiedMAT* pCMAT;
		pCMAT = m_BPTLib.GetCMAT(i, nType);
		if (pCMAT == NULL)
			{ _ASSERT(FALSE); return FALSE; }
		m_GMA_nCount[i] = NUMOFCMA;
		pCMAT->GetAll((int*)m_GMA_naryMA[i], &(m_GMA_nCount[i]));
	}
	return TRUE;
}

/******************************************************************************
	功能:	确定各给定魔法属性的等级要求和出现概率
	入口:	nType: 指定装备
			m_GMA_naryMA数组: 给出全部魔法属性的索引值
	出口:	成功时返回非零. m_GMA_naryLevel数组给出上述魔法属性的等级要求
							m_GMA_naryDropRate给出上述魔法属性的出现概率
			失败时返回零
******************************************************************************/
BOOL KItemGenerator::GMA_GetLevelAndDropRate(int nType)
{
	//TODO: 可能需要对nType进行转换, 从装备类型值变成 m_BPTLib.m_CMAT 数组的索引

	for (int i = 0; i < 2; i++)		// 0: 前缀, 1: 后缀
	{
		for (int n = 0; n < m_GMA_nCount[i]; n++)
		{
			const KMAGICATTRIB_TABFILE* pMATF;
			pMATF = GetMARecord(m_GMA_naryMA[i][n]);
			if (pMATF == NULL)
				{ _ASSERT(FALSE); return FALSE; }
			m_GMA_naryLevel[i][n] = pMATF->m_nLevel;
			m_GMA_naryDropRate[i][n] = pMATF->m_DropRate[nType];		// 可优化
		}
	}
	return TRUE;
}

/******************************************************************************
	功能:	从全部可用的魔法属性中选出符合条件的魔法
	入口:	nPos: 0: 选前缀, 1: 选后缀
			nLevel: 对魔法属性的等级要求
			nLucky: 运气值
			m_GMA_naryMA数组: 给出全部可用的魔法属性的索引值
	出口:	*pINA 给出所选魔法的核心参数
******************************************************************************/
void KItemGenerator::GMA_ChooseMA(int nPos, int nLevel, int nLucky, KItemNormalAttrib* pINA)
{
	_ASSERT(pINA != NULL);

	// 赋初值
	pINA->nAttribType = 0;
	pINA->nValue[0] = 0;
	pINA->nValue[1] = 0;
	pINA->nValue[2] = 0;

	// 筛选出全部可用的魔法属性
	int nDropRate = ::GetRandomNumber(0, 100) - nLucky;
	int nCount = GMA_GetCandidateMA(nPos, nLevel, nDropRate);
	if (nCount > 0)
	{
		int nFinal = ::GetRandomNumber(0, nCount);
		int nMAi = m_GMA_naryCandidateMA[nFinal];
		int nMA = m_GMA_naryMA[nPos][nMAi];
		if (nMA == -1)	// 随机出重复的属性了
		{
			pINA->nAttribType = 0;
			return;
		}
		m_GMA_naryMA[nPos][nMAi] = -1;		// 置为-1,表示该MA已用
		const KMAGICATTRIB_TABFILE* pMATF = GetMARecord(nMA);
		if (NULL != pMATF)
		{
			const KMACP* pMACP = &(pMATF->m_MagicAttrib);
			pINA->nAttribType = pMACP->nPropKind;
			pINA->nValue[0] = ::GetRandomNumber(pMACP->aryRange[0].nMin, pMACP->aryRange[0].nMax);
			pINA->nValue[1] = ::GetRandomNumber(pMACP->aryRange[1].nMin, pMACP->aryRange[1].nMax);
			pINA->nValue[2] = ::GetRandomNumber(pMACP->aryRange[2].nMin, pMACP->aryRange[2].nMax);
		}
	}
}

/******************************************************************************
	功能:	获取指定的魔法属性记录
	入口:	i: 指定记录
	出口:	成功时返回指向该记录的指针
			失败时返回NULL
******************************************************************************/
const KMAGICATTRIB_TABFILE* KItemGenerator::GetMARecord(int i) const
{
	return m_BPTLib.GetMARecord(i);
}

/******************************************************************************
	功能:	从全部可用的魔法属性中选出符合条件的魔法
	入口:	nPos: 0: 选前缀, 1: 选后缀
			nLevel: 对魔法属性的等级要求
			nDropRate: 选出出现概率大于此值的魔法属性
			m_GMA_naryMA数组: 给出全部可用的魔法属性的索引值
			m_GMA_naryLevel数组: 给出上述魔法属性的等级要求
			m_GMA_naryDropRate数组: 给出上述魔法属性的出现概率
	出口:	m_GMA_naryCandidateMA数组给出符合条件的魔法
	说明:	若 n = m_GMA_naryMA[nPos][m_GMA_naryCandidateMA[i]]
			则 GetMARecord(n) 返回指向魔法属性结构的指针
******************************************************************************/
int KItemGenerator::GMA_GetCandidateMA(int nPos, int nLevel, int nDropRate)
{
	int nCount = 0;
	for (int i = 0; i < m_GMA_nCount[nPos]; i++)
	{
		if (m_GMA_naryMA[nPos][i] != -1 &&		// -1表示该MA已用过
			m_GMA_naryLevel[nPos][i] == nLevel &&
			m_GMA_naryDropRate[nPos][i] >= nDropRate)
		{
			m_GMA_naryCandidateMA[nCount++] = i;
		}
	}
	return nCount;
}

/******************************************************************************
T筼 item khi load t?database
Editor: Guve
******************************************************************************/
BOOL KItemGenerator::Gen_ExistEquipment(IN int nDetailType,
								   IN int nParticularType,
								   IN int nSeriesReq,
								   IN int nLevel,
								   IN const int* pnaryMALevel,
								   IN OUT KItem* pItem)
{
	_ASSERT(this != NULL);
	_ASSERT(pItem != NULL);

	BOOL bEC = FALSE;
	int i = nParticularType * 10 + nLevel - 1;
	const KBASICPROP_EQUIPMENT* pEqu = NULL;
	switch(nDetailType)
	{
	case equip_meleeweapon:
		pEqu = m_BPTLib.GetMeleeWeaponRecord(i);
		break;
	case equip_rangeweapon:
		pEqu = m_BPTLib.GetRangeWeaponRecord(i);
		break;
	case equip_armor:
		pEqu = m_BPTLib.GetArmorRecord(i);
		break;
	case equip_helm:
		pEqu = m_BPTLib.GetHelmRecord(i);
		break;
	case equip_boots:
		pEqu = m_BPTLib.GetBootRecord(i);
		break;
	case equip_belt:
		pEqu = m_BPTLib.GetBeltRecord(i);
		break;
	case equip_amulet:
		pEqu = m_BPTLib.GetAmuletRecord(i);
		break;
	case equip_ring:
		pEqu = m_BPTLib.GetRingRecord(i);
		break;
	case equip_cuff:
		pEqu = m_BPTLib.GetCuffRecord(i);
		break;
	case equip_pendant:
		pEqu = m_BPTLib.GetPendantRecord(i);
		break;
	case equip_horse:
		pEqu = m_BPTLib.GetHorseRecord(i);
		break;
	case equip_mask:
		pEqu = m_BPTLib.GetMaskRecord(nParticularType);
		break;
	default:
		break;
	}
	if (NULL == pEqu)
		{ _ASSERT(FALSE); return bEC; }
	pItem->SetAttrib_CBR(pEqu);
	if(nDetailType == equip_mask)
	{
		if(nLevel > 0)
			pItem->SetLevel(nLevel);
		else
			pItem->SetLevel(0);
	}
	else
		pItem->SetSeries(nSeriesReq);
	bEC = TRUE;
	KItemNormalAttrib	sMA[6];
	for(i=0; i<6; ++i)
	{
		if(!pnaryMALevel[i*2])
			break;
		sMA[i].nAttribType = pnaryMALevel[i*2];
		sMA[i].nValue[0] = pnaryMALevel[i*2+1];
		sMA[i].nValue[1] = -1;
		if(sMA[i].nAttribType == magic_addphysicsdamage_p)
			sMA[i].nValue[2] = 6;
	}
	pItem->SetAttrib_MA(sMA);

	return bEC;
}

BOOL KItemGenerator::Gen_Quest(IN int nDetailType, IN OUT KItem* pItem, IN int nCount)
{
	_ASSERT(this != NULL);
	_ASSERT(pItem != NULL);

	BOOL bEC = FALSE;
	
	const KBASICPROP_QUEST* pQuest = NULL;
	pQuest = m_BPTLib.GetQuestRecord(nDetailType);
	if (NULL == pQuest)
	{
		_ASSERT(FALSE);
		return bEC;
	}
	*pItem = *pQuest;
	if(nCount > 0)
		pItem->SetCount(nCount);
	return TRUE;
}

BOOL KItemGenerator::Gen_TownPortal(IN int nDetailType, IN OUT KItem* pItem)
{
	_ASSERT(this != NULL);
	_ASSERT(pItem != NULL);

	BOOL bEC = FALSE;
	
	const KBASICPROP_TOWNPORTAL* pPortal = NULL;
	pPortal = m_BPTLib.GetTownPortalRecord(nDetailType);
	if (NULL == pPortal)
	{
		_ASSERT(FALSE);
		return bEC;
	}
	*pItem = *pPortal;
	return TRUE;
}

BOOL KItemGenerator::Gen_MAScript(IN int nDetailType,
								   IN int nParticularType,
								   IN int nLevel,
								   IN int nSeriesReq,
								   IN int nCount,
								   IN const int* pnaryMALevel,
								   IN OUT KItem* pItem)
{
	_ASSERT(this != NULL);
	_ASSERT(pItem != NULL);

	BOOL bEC = FALSE;
	int i = m_BPTLib.FindMAScriptRecord(nDetailType, nParticularType);
	const KBASICPROP_MASCRIPT* pMAScript = m_BPTLib.GetMAScriptRecord(i);
	if (NULL == pMAScript)
	{
		return bEC;
	}
	*pItem = *pMAScript;
	pItem->SetGenParam(i);
	if(nLevel > 0)
		pItem->SetLevel(nLevel);
	if(nSeriesReq >= 0 && nSeriesReq < series_num)
		pItem->SetSeries(nSeriesReq);
	pItem->SetCount(nCount);
	if(pMAScript->m_nSkillID > 0)
		pItem->SetGroupId(pMAScript->m_nSkillID);
	return TRUE;
}
