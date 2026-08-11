/*****************************************************************************************
//	ÍøÂçÁ¬½Ó£¬»ã¼¯Óû·¢ËÍÏûÏ¢°üÓëÅÉËÍµÖ´ïÏûÏ¢°üµÄ´úÀíÖÐÐÄ
//	Copyright : Kingsoft 2002
//	Author	:   Wooy(Wu yue)
//	CreateTime:	2002-10-6
------------------------------------------------------------------------------------------
	EngineÀïµÄKNetClientÄ£¿é°ü×°ÊµÏÖÁËÍøÂçÁª½ÓÓë´«ËÍ°ü£¬´ËÄ£¿éÎªKNetClient¾ßÌåÓ¦ÓÃÊ±µÄ´úÀí£¬
Ö÷ÒªÓÃÓÚ»ã¼¯¾ßÌåÓ¦ÓÃÖÐÐèÒª·¢ËÍµÄÍøÂç°ü£¬ÒÔ¼°°ÑµÖ´ïµÄÍøÂç°üÅÉËÍµ½¸÷Ïà¹Ø´¦Àí½ÓÊÜÄ£¿é¡£
*****************************************************************************************/
#pragma once
//#include "KNetClient.h"
#include "../../../Headers/KProtocol.h"
#include "../../../Headers/iClient.h"

struct iKNetMsgTargetObject;
typedef void (*fnNetMsgCallbackFunc)(void* pMsgData);

typedef HRESULT ( __stdcall * pfnCreateClientInterface )(
			REFIID	riid,
			void	**ppv
		);


//====Ä¬ÈÏµÄ³¬Ê±Ê±ÏÞ====
#define	DEF_TIMEOUT_LIMIT	4000	//4 seconds for login/network requests

class KNetConnectAgent
{
public:
	KNetConnectAgent();
	~KNetConnectAgent();
	//³õÊ¼»¯
	int		Initialize();
	//ÍË³ö
	void	Exit();

	//½¨Á¢Á¬½Ó
	int		ClientConnectByNumericIp(const unsigned char* pIpAddress, unsigned short pszPort);
	//¹Ø±ÕÁ¬½Ó
	void	DisconnectClient();

	int		ConnectToGameSvr(const unsigned char* pIpAddress, unsigned short uPort, GUID* pGuid);
	void	DisconnectGameSvr();

	//·¢ËÍÏûÏ¢
	int		SendMsg(const void *pBuffer, int nSize);
	//³ÖÐøÐÔÐÐÎª
	void	Breathe();

	void	UpdateClientRequestTime(bool bCancel, unsigned int uTimeLimit = DEF_TIMEOUT_LIMIT);

	//×¢²áµÖ´ïÏûÏ¢ÏìÓ¦º¯Êý
	void	RegisterMsgTargetObject(PROTOCOL_MSG_TYPE Msg, iKNetMsgTargetObject* pObject);

	int		IsConnecting(int bGameServ);

	void	TobeDisconnect();

private:
	bool	ProcessSwitchGameSvrMsg(void* pMsgData);			//´¦ÀíÓÎÏ·ÊÀ½ç·þÎñÆ÷µÄÍøÂçÏûÏ¢

private:
	IClient*				m_pClient;
	IClient*				m_pGameSvrClient;

private:
#define	MAX_MSG_COUNT	1 << (PROTOCOL_MSG_SIZE * 8)
	iKNetMsgTargetObject*	m_MsgTargetObjs[MAX_MSG_COUNT];

	HMODULE					    m_hModule;
	pfnCreateClientInterface    m_pFactroyFun;
	IClientFactory             *m_pClientFactory;



	bool					m_bIsClientConnecting;
	bool					m_bIsGameServConnecting;
	bool					m_bTobeDisconnect;
	unsigned int			m_uClientRequestTime;		//·¢³öÇéÇóµÄÊ±¼ä
	unsigned int			m_uClientTimeoutLimit;
};

extern KNetConnectAgent g_NetConnectAgent;
