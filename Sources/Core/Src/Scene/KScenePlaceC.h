// ***************************************************************************************
// ͼͻ˰棩
// Copyright : Kingsoft 2002
// Author    : wooy(wu yue)
// CreateTime: 2002-11-11
// ---------------------------------------------------------------------------------------
// ***************************************************************************************

#ifndef KSCENEPLACEC_H_HEADER_INCLUDED_C22D00B5
#define KSCENEPLACEC_H_HEADER_INCLUDED_C22D00B5
#include "../../Represent/iRepresent/KRepresentUnit.h"
#include "KScenePlaceRegionC.h"
#include "SceneDataDef.h"
#include "KIpoTree.h"
#include "ScenePlaceMapC.h"

// 
/*
ӣ2300100RGB1
󣺣100300RGB1RGB2
300500RGB2
î500700RGB2RGB3
700900RGB3RGB4
ȣ9001100RGB4RGB5
磺11001300RGB5
δ13001500RGB5RGB4
꣺15001700RGB4RGB6
ϣ17001900RGB6RGB7
磺19002100RGB7RGB1
21002300RGB1
*/
#define ENVLIGHT_MIDNIGHT	0	//RGB1ҹĺڰ
#define ENVLIGHT_DAWN		1	//RGB2ǰЩĺڰ
#define ENVLIGHT_MORNING	2	//RGB3̫ճʱ
#define ENVLIGHT_FORENOON	3	//RGB4ͼ
#define ENVLIGHT_NOON		4	//RGB5ĸ
#define ENVLIGHT_DUSK		5	//RGB6̫ɽϼ
#define ENVLIGHT_EVENING	6	//RGB7ɵ

class EnvironmentLight
{
private:
	KLColor m_cLight[7];
public:
	EnvironmentLight();
	// õnIdxɫ
	void SetLight(const KLColor &cLight, int nIdx);
	// õnIdxɫ
	void SetLight(BYTE r, BYTE g, BYTE b, int nIdx);
	// 7ɫ
	void SetLight(KLColor *pLight);
	// ȡþһ쿪ʼnMinutesʱĻɫ
	DWORD GetEnvironmentLight(int nMinutes);
};

//================================================================
//	һ򱻼ϺĻصĺԭ
//================================================================
//	: nRegionH, nRegionV ֱΪϵĺ
typedef void (*funScenePlaceRegionLoadedCallback)(int nRegionH, int nRegionV);

class KWeather;


#define KMAX_PREV_LOAD_POS_NUM  5
typedef struct _KPrevLoadPosItem
{
    int     m_nNum;
    POINT   m_Pos[KMAX_PREV_LOAD_POS_NUM];

} KPrevLoadPosItem;


#define MAX_PREV_LOAD_FILE_COUNT    1024
#define PREV_LOAD_FILE_MIN_SIZE     (32 * 1024)

typedef struct _KPrevLoadFileNameAndFrameAndFrame
{
    char szName[MAX_RESOURCE_FILE_NAME_LEN];
    int  nFrame;
} KPrevLoadFileNameAndFrame;



//typedef struct _KPrevLoadItem
//{
//    POINT
//
//} KPrevLoadItem;


//##ModelId=3DB8F8B40128
//##Documentation
//## һͼ
class KScenePlaceC
{
  public:
	//##ModelId=3DBE3B53008C
	//##Documentation
	//## 캯
	//## һm_szPlaceRootPath[0] = 0
	KScenePlaceC();

	//##ModelId=3DD17A770383
	//##Documentation
	//## call Terminate
	~KScenePlaceC();

	//##ModelId=3DCAA6A703DB
	//##Documentation
	//## ʼ
	bool Initialize();

	//##ModelId=3DCD58AC00BC
	//##Documentation
	//## ܡͷŶȫ붯̬Դ
	void Terminate();

	//##ModelId=3DCAA64C01DA
	//##Documentation
	//## /ָĳͼ
	bool OpenPlace(
		//##Documentation
		//## ͼ
		int nPlaceIndex);

	//##ModelId=3DCAAE3703A6
	//##Documentation
	//## رճͼ
	void ClosePlace();

	//##ModelId=3DCD7F0A0071
	//##Documentation
	//## Ƴ
	void Paint();
	bool GetCurrentPaintFocus(int& nX, int& nY) const
	{
		if (!m_bCurrentPaintFocusValid) return false;
		nX = m_CurrentPaintFocusPosition.x;
		nY = m_CurrentPaintFocusPosition.y;
		return true;
	}

	//##ModelId=3DBCE7B70358
	//##Documentation
	//## óͼĽ
	void SetFocusPosition(
		//##Documentation
		//## x
		int nX, 
		//##Documentation
		//## y
		int nY, 
		//##Documentation
		//## z
		int nZ);

	void GetFocusPosition(
		//##Documentation
		//## x
		int& nX, 
		//##Documentation
		//## y
		int& nY, 
		//##Documentation
		//## z
		int& nZ);

//----ڲڳͼĶ볡ϵĲ----

	//##ModelId=3DCAA6B90196
	//##Documentation
	//## ʱ(ڳеǲڳͼĶ)С
	//## Ӷӵлõıǡ0ֵʾӶʧܡ߶ûвڳڳǰĴУӲԡ
	unsigned int AddObject(
		//##Documentation
		//## ҪĶ
		unsigned int uGenre, 
		//##Documentation
		//## ҪĶid
		int nId, 
		//##Documentation
		//## λꡣ
		int x, int y, int z,
		int eLayerParam = IPOT_RL_OBJECT);

	//##ModelId=3DCAA7000085
	//##Documentation
	//## ƶڳеǲڳͼĶڳеλá
	//## ƶɹ򷵻ضڳͼеıֵΪ0ֵʧ򷵻0Ƴ˳ǰҲ0
	unsigned int MoveObject(
		//##Documentation
		//## ҪƶĶ
		unsigned int uGenre, 
		//##Documentation
		//## ҪƶĶid
		int nId, 
		//##Documentation
		//## Ŀꡣ
		int x, int y, int z, 		 
		//##Documentation
		//## ƶǰڳеıֵ¼룬0ֵ
		unsigned int& uRtoid,
		int eLayerParam = IPOT_RL_OBJECT);

	//##ModelId=3DCAA70603E3
	//##Documentation
	//## ȥڳеǲڳͼĶ
	void RemoveObject(
		//##Documentation
		//## ҪȥĶ
		unsigned int uGenre, 
		//##Documentation
		//## ҪȥĶid
		int nId, 
		//##Documentation
		//## ǰڳеıֵ
		unsigned int& uRtoid);

	void Breathe();
	
	void SetRepresentAreaSize(int nWidth, int nHeight);

	void ProjectDistToSpaceDist(int& nXDistance, int& nYDistance);

	//ͼ/ͼ豸 תΪռ
	void ViewPortCoordToSpaceCoord(
		int& nX,	//룺ͼ/ͼ豸xռx
		int& nY,	//룺ͼ/ͼ豸yռy
		int  nZ		//õĿռz
		);
	
	void GetRegionLeftTopPos(int nRegionX, int nRegionY, int& nLeft, int& nTop);
	
	long GetObstacleInfo(int nX, int nY);
	long GetObstacleInfoMin(int nX, int nY, int nOffX, int nOffY);

	void RepresentShellReset();


	//óһ򱻼ϺĻص
	void	SetRegionLoadedCallback(funScenePlaceRegionLoadedCallback pfunCallback);
	
	void	SetHightLightSpecialObject(int nRegionX, int nRegionY, int nBioIndex);
	void	UnsetHightLightSpecialObject();

	void	GetSceneNameAndFocus(char* pszName, int& nId, int& nX, int& nY);

	// ûɫ
	void SetAmbient(DWORD dwAmbient);
	void SetCurrentTime(DWORD dwCurrentTime);
	// 24Сʱ仯ĵidxԪidxȡֵ06
	void SetEnvironmentLight(int idx, BYTE r, BYTE g, BYTE b);

	// ǷͼڽԴڱְ
	void EnableBioLights(bool bEnable);
	// Ƿ̬
	void EnableDynamicLights(bool bEnable);
	
	void ChangeWeather(int nWeatherID);

	//ȡСͼϢ
	int GetMapInfo(KSceneMapInfo* pInfo);
	//õͼ
	void SetMapParam(unsigned int uShowElems, int nSize);
	//óĵͼĽ(λ:)
	void SetMapFocusPositionOffset(int nOffsetX, int nOffsetY);
	//Сͼ
	void  PaintMap(int nX, int nY);
	//Ƿͼƶƶ
	void FollowMapMove(int nbEnable);

	void EnableWeather(int nbEnable);


private:

	//##ModelId=3DCE68BB0238
	//##Documentation
	//## ıطΧ
	void ChangeLoadArea();

	//##ModelId=3DBF946D0053
	//##Documentation
	//## ȶȫ뿪Χ󣬵FreePrerenderͷЩԤȾõĴŵرͼȻԤźš
	void ChangeProcessArea();

	//##ModelId=3DBFA1460230
	//##Documentation
	//## ΧڵԤ
	void Preprocess();

	//##ModelId=3DCCBD7B0239
	//##Documentation
	//## /ͷԤϢ
	void ClearPreprocess(int bIncludeRto);

	//##ModelId=3DBDBC7200B4
	//##Documentation
	//## µҪص
	void SetRegionsToLoad();

	//##ModelId=3DCB6BC90345
	//##Documentation
	//## ݵḶ́ݼͼ
	//## Use Case View//ͻ/ͼ/State/Activity Model/Ļ ߳̿ռִ
	void LoadProcess();

	//##ModelId=3DCCD131018C
	//##Documentation
	//## ̵ִ߳ں
	//## pParamΪKScenePlaceCָ룬LoadAndPreprocess
	//## ̶ֵΪ0
	static DWORD WINAPI LoadThreadEntrance(void* pParam);

	void PrerenderGround(bool bForce);

	void ARegionLoaded(KScenePlaceRegionC* pRegion);
	
	KRUImage* GetFreeGroundImage();

	KScenePlaceRegionC*	GetLoadedRegion(int h, int v);

	void SetLoadingStatus(bool bLoading);

    void PreLoadProcess();

private:

	//##ModelId=3DCAC1D103D7
	//##Documentation
	//## KScenePlaceCв
	enum SP_WORKING_PARAM { 
		//##Documentation
		//## (̬)طΧ/Ĳ໹ҪķΧ(λ)
		//## ȡֵ(طΧ/ԽĿ-1)/2
		SPWP_LOAD_EXTEND_RANGE = 3,
		//##Documentation
		//## صĿ
		SPWP_MAX_NUM_REGIONS = 49,
		//##Documentation
		//## ܹ봦ΧĿ
		SPWP_NUM_REGIONS_IN_PROCESS_AREA = 9,
		//##Documentation
		//## ƶԽٸ֮趯̬طΧ
		SPWP_TRIGGER_RANGE = 2,
		//## ƶͻȻԽٸᴥ״̬
		SPWP_TRIGGER_LOADING_RANGE = 4,
		//##Documentation
		//## Ŀ
		SPWP_PROCESS_RANGE = 3,
		//##Documentation
		//## ʾһңԶֵԶЧ귶Χ
	    SPWP_FARAWAY_COORD = -2147476129,

		SPWP_REPRESENT_RECT_WINDAGE_X = 140,
		SPWP_REPRESENT_RECT_WINDAGE_T = 90,
		SPWP_REPRESENT_RECT_WINDAGE_B = 150,
		//##Documentation
		//##ܴԤȴԤȾѼĿ
		SPWP_PROCESS_PRERENDER_REGION_COUNTER_TRIGGER = 25,
		//##Documentation
		//##޼ʾĶı־
		SPWP_NO_HL_SPECAIL_OBJECT = -1,
		//##Documentation
		//##лͼصĳʱʱ(λ)
        SPWP_SWITCH_SCENE_TIMEOUT = 30000,
		//##Documentation
		//##rtoĴԼһ/߶
        SPWP_RTO_HALF_RANGE = 80,
		//ûг
		SPWP_NO_SCENE = -1,
	};

private:

	//һ򱻼ϺĻصָ롣
	funScenePlaceRegionLoadedCallback m_pfunRegionLoadedCallback;

	//##ModelId=3DD2CA84021C
	//##Documentation
	//## ־ǷѾɹִرʼˡ
	bool	m_bInited;

	//## ڼ
	bool	m_bLoading;

	bool	m_bEnableWeather;

	//Ƿͼƶƶ
	bool	m_bFollowWithMap;

	//ԭʼĽֵֻ꣬m_bFollowWithMapΪֵʱЧ
	POINT	m_OrigFocusPosition;

	//ͼƫ
	POINT	m_MapFocusOffset;

	//##ModelId=3DCE5BF203D6
	//##Documentation
	//## ,˵z=0ƽϡ
	POINT m_FocusPosition;

	//##ModelId=3DCD42F60221
	//##Documentation
	//## ڵݺ
	POINT m_FocusRegion;

	//##ModelId=3DD3B98002E1
	//##Documentation
	//## ǰĽڵɵĽڵֵӵĲֵ
	//## ۼƽƶԽ''Ŀ
	SIZE m_FocusMoveOffset;

	//##ModelId=3DCB792F02D7
	//##Documentation
	//## źţƼźţ
	HANDLE m_hLoadRegionEvent;

	//## лͼؽź
	HANDLE m_hSwitchLoadFinishedEvent;

	//##ModelId=3DCD478001BA
	//##Documentation
	//## Ԥź(Ԥź)
	int	m_bPreprocessEvent;

	//##ModelId=3DCB83F30160
	//##Documentation
	//## ݴ/ٽ
	CRITICAL_SECTION m_ProcessCritical;

	//##ModelId=3DCAB77A01E9
	//##Documentation
	//## س޸Ĺؼݵٽ
	CRITICAL_SECTION m_LoadCritical;

	//##ModelId=3DCB84480342
	//##Documentation
	//## m_RegionListAdjustCriticalٽ
	CRITICAL_SECTION m_RegionListAdjustCritical;


	//##ModelId=3DB907ED02B7
	//##Documentation
	//## ̶һĿRegionʵ
	KScenePlaceRegionC m_RegionObjs[SPWP_MAX_NUM_REGIONS];

	//##ModelId=3DDBC73803A4
	//##Documentation
	//## 봦ΧԼָ롣
	KScenePlaceRegionC* m_pInProcessAreaRegions[SPWP_NUM_REGIONS_IN_PROCESS_AREA];

	KRUImage	m_RegionGroundImages[SPWP_NUM_REGIONS_IN_PROCESS_AREA];
	int			m_nNumGroundImagesAvailable;

	//##ModelId=3DCAB33A01CE
	//##Documentation
	//## ͼļĸĿ¼߳ͼļڵĿ¼
	//## KScenePlaceCm_szPlaceRootPath[0]ǷΪ0ΪǷ򿪳ͼжݡ
	char m_szPlaceRootPath[80];
	char m_szSceneName[32];
	int	 m_nSceneId;
	//##ModelId=3DD2E1410028
	//##Documentation
	//## m_pRegionsбm_nFirstToLoadIndexֵЧΧڣʾm_pRegionsбm_nFirstToLoadIndex֮ǰԪΪѾݵָ룬ʣڵԪΪݵָ롣m_nFirstToLoadIndexֵЧΧʾбȫָѾݡ
	int m_nFirstToLoadIndex;

	//##ModelId=3DD2E1410064
	//##Documentation
	//## ָб
	//## беÿԪݶһָ룬Щֱָָm_RegionObjsеһԪأһһӦĹϵָбиԪص˳㷢仯
	KScenePlaceRegionC* m_pRegions[SPWP_MAX_NUM_REGIONS];

	//##ModelId=3DD3A6140179
	//##Documentation
	//## ִмԤ̵߳ľ
	HANDLE m_hLoadAndPreprocessThread;

	//##ModelId=3DD960150394
	//##Documentation
	//## ڴΧڵĲֶļϡ
	KIpoTree m_ObjectsTree;

	RECT m_RepresentArea;
	SIZE m_RepresentExactHalfSize;

	// Last valid visual camera position. During region/leaf migration the local
	// player scene id can be unavailable for a single render frame. Keeping this
	// value prevents a one-frame jump back to the 18 Hz logical position.
	POINT m_RenderFocusPosition;
	POINT m_RenderFocusTarget;
	DWORD m_dwRenderFocusTime;
	bool  m_bRenderFocusValid;
	POINT m_CurrentPaintFocusPosition;
	bool  m_bCurrentPaintFocusValid;
	
	long m_bRenderGround;

	int		m_nHLSpecialObjectRegionX, m_nHLSpecialObjectRegionY;
	int		m_nHLSpecialObjectBioIndex;

	KBuildinObj**	m_pObjsAbove;
	unsigned int	m_nNumObjsAbove;

	// ǰʱ䣬һ쿪ʼķ
	int m_nCurrentTime;

	// Ķ
	EnvironmentLight m_EnLight;
	// ָ
	KWeather *m_pWeather;
	//Сͼ
	KScenePlaceMapC	m_Map;

private:
	//##ModelId=3DDB39BA029B
	//##Documentation
	//## ȴı
	static int m_PRIIdxTable[SPWP_MAX_NUM_REGIONS];

	//##ModelId=3DDB39150334
	//##Documentation
	//## طΧڳõı
	static POINT m_RangePosTable[SPWP_MAX_NUM_REGIONS];

	// ǰķҪصҵǰRegionƫ
    static const KPrevLoadPosItem m_PrevLoadPosOffset[3][3];

	// ǰķҪصRegion
    KPrevLoadPosItem    m_PreLoadPosItem;

    int                 m_nPrevLoadFileCount;
    KPrevLoadFileNameAndFrame   m_PrevLoadFileNameAndFrames[MAX_PREV_LOAD_FILE_COUNT];

};

extern KScenePlaceC	g_ScenePlace;
#endif /* KSCENEPLACEC_H_HEADER_INCLUDED_C22D00B5 */
