 // S3Client.cpp : Defines the entry point for the application.
//

#include "KWin32.h"
#include "KCore.h"
#include "S3Client.h"
#include "KWin32Wnd.h"
#include "../../Represent/iRepresent/iRepresentShell.h"
#include "Ui/UiShell.h"
#include "NetConnect/NetConnectAgent.h"
#include "TextCtrlCmd/TextCtrlCmd.h"
#include "KPakList.h"
#include "Ui/Elem/TextPic.h"
#include "Ui/Elem/UiCursor.h"
#include "Ui/Elem/SpecialFuncs.h"
#include "Ui/FilterTextLib.h"
#include "Ui/ChatFilter.h"
#include "Ui/uibase.h"
#include "ErrorCode.h"
#include <mmsystem.h>
#pragma comment(lib, "winmm.lib")
#include <stdio.h>
#include <stdarg.h>
#include "../Common/FPS60Trace.h"

#define ClientVersion
static void FPS60ProfilerLog(const char* pszFormat, ...)
{
    va_list args;
    va_start(args, pszFormat);
    FPS60TraceWrite("fps60_profiler.log", "GAMELOOP", pszFormat, args);
    va_end(args);
}

static void FPS60ClientDiagLog(const char* pszFormat, ...)
{
    va_list args;
    va_start(args, pszFormat);
    FPS60TraceWrite("fps60_diag.log", "LOOP", pszFormat, args);
    va_end(args);
}

#define ClientVersion
KMyApp		MyApp;
HINSTANCE	hInst;
KPakList	g_PakList;
CFilterTextLib g_libFilterText;
CChatFilter g_ChatFilter;


#define	QUIT_QUESTION_ID	"22"
#define	GAME_TITLE			"23"

#define REPRESENT_MODULE_2			"Represent2.dll"
#define REPRESENT_MODULE_3			"Represent3.dll"
#define CREATE_REPRESENT_SHELL_FUN	"CreateRepresentShell"
#define	GAME_FPS			18
#define PAINT_FPS_2D		60
#define PAINT_FPS_3D		60
//Representģ��ӿڵ�ָ��
struct iRepresentShell*	g_pRepresentShell = NULL;
struct IInlinePicEngineSink* g_pIInlinePicSink = NULL;
iCoreShell*				g_pCoreShell = NULL;
KMusic*					g_pMusic = NULL;

#define	DYNAMIC_LINK_REPRESENT_LIBRARY

#ifdef DYNAMIC_LINK_REPRESENT_LIBRARY
	static HMODULE		l_hRepresentModule = NULL;
	int					g_bRepresent3 = false;
#endif
	
int					g_bScreen = true;
char				g_szGameName[32] = "JXCuuMong";


KClientCallback g_ClientCallback;
#define	NEWINITSCREEN_W	960
#define NEWINITSCREEN_H	720

/*
 * Add this macro by liupeng on 2003.3.20
 * This macro is helper that can judge some legal character
 */
#define _private_IS_SPACE(c)   ((c) == ' ' || (c) == '\r' || (c) == '\n' || (c) == '\t' || (c) == 'x')
#define IS_SPACE(c)	_private_IS_SPACE(c)

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
 	// TODO: Place code here.

	/*
	 * Add this funtion by liupeng on 2003.3.20
	 * We can find some error when start a console tracer
	 */
#ifdef	TRUE

	bool bOpenTracer = false;

    while( lpCmdLine[0] == '-' || lpCmdLine[0] == '/' )
    {
        lpCmdLine++;
		
        switch ( *lpCmdLine++ )
        {
		case 'c':
        case 'C':
            bOpenTracer = true;
            break;
        }
		
        while( IS_SPACE( *lpCmdLine ) )
        {
            lpCmdLine++;
        }
    }
	
	if ( bOpenTracer ) 
	{
		AllocConsole();
	}

#endif // End of this function

	hInst = hInstance;
	timeBeginPeriod(1);
	if (MyApp.Init(hInstance))
		MyApp.Run();
	timeEndPeriod(1);

#ifdef TRUE

	if ( bOpenTracer )
	{
		FreeConsole();
	}

#endif
	Error_Box();

	// GameExit() has already released network, Core, UI, audio and renderer.
	// ExitProcess still broadcasts DLL_PROCESS_DETACH; legacy DirectDraw/GDI+
	// globals can deadlock there and leave a one-thread zombie Game.exe.
	TerminateProcess(GetCurrentProcess(), 0);

	return 0;
}

KMyApp::KMyApp()
{
	m_pInlinePicSink = NULL;
}

BOOL InitRepresentShell(BOOL bFullScreen, int nWidth, int nHeight)
{
	Error_SetErrorString(g_bRepresent3 ? REPRESENT_MODULE_3 : REPRESENT_MODULE_2);
	if (g_pRepresentShell == NULL)
	{
#ifdef DYNAMIC_LINK_REPRESENT_LIBRARY
		if (l_hRepresentModule == NULL &&
			(l_hRepresentModule = LoadLibrary(g_bRepresent3 ? REPRESENT_MODULE_3 : REPRESENT_MODULE_2)) == NULL)
		{
			Error_SetErrorCode(ERR_T_LOAD_MODULE_FAILED);
			return FALSE;
		}
		fnCreateRepresentShell pCreate = (fnCreateRepresentShell)GetProcAddress(
			l_hRepresentModule, CREATE_REPRESENT_SHELL_FUN);
		if (pCreate == NULL || 
			(g_pRepresentShell = pCreate()) == NULL)
		{
			Error_SetErrorCode((pCreate == NULL) ? ERR_T_MODULE_UNCORRECT : ERR_T_MODULE_INIT_FAILED);
			return FALSE;
		}
#else
		g_pRepresentShell = CreateRepresentShell();
#endif
	}
	if(g_pRepresentShell->Create(nWidth, nHeight, bFullScreen != 0))
	{
		return TRUE;
	}
	else
	{
		Error_SetErrorCode(g_bRepresent3 ? ERR_T_REPRESENT3_INIT_FAILED : ERR_T_REPRESENT2_INIT_FAILED);
		return FALSE;
	}
}

static void SetStartupClientWindowSize(int nWidth, int nHeight, BOOL bFullScreen)
{
	if (bFullScreen)
		return;
	HWND hWnd = g_GetMainHWnd();
	if (!hWnd)
		return;
	RECT rcClient;
	if (GetClientRect(hWnd, &rcClient) &&
		rcClient.right - rcClient.left == nWidth &&
		rcClient.bottom - rcClient.top == nHeight)
		return;
	DWORD dwStyle = GetWindowLong(hWnd, GWL_STYLE);
	DWORD dwExStyle = GetWindowLong(hWnd, GWL_EXSTYLE);
	RECT rc = { 0, 0, nWidth, nHeight };
	AdjustWindowRectEx(&rc, dwStyle, GetMenu(hWnd) != NULL, dwExStyle);
	SetWindowPos(hWnd, NULL, 0, 0, rc.right - rc.left, rc.bottom - rc.top,
		SWP_NOMOVE | SWP_NOZORDER | SWP_NOACTIVATE);
}
BOOL KMyApp::GameInit()
{
	Error_SetErrorString("KMyApp::GameInit");
    #ifdef KUI_USE_HARDWARE_MOUSE
	
    ShowMouse(TRUE);
    
    #else   // KUI_USE_HARDWARE_MOUSE
	
    ShowMouse(FALSE);
    
    #endif

	g_SetRootPath(NULL);
	g_SetFilePath("\\");

	// KIniFile*	pSetting = g_UiBase.GetCommConfigFile();
	// if (pSetting)
	// {
	// 	pSetting->GetString("Main", "GameName", "������Ե�������", g_szGameName, sizeof(g_szGameName));
    //     SetWindowText(g_GetMainHWnd(), g_szGameName);
	// }
	SetWindowTextW(g_GetMainHWnd(),  L"V\u00F5 L\u00E2m Truy\u1EC1n K\u1EF3");

//#ifdef _DEBUG
	g_FindDebugWindow("#32770"," DebugWin");
//#endif

	KIniFile	IniFile;
	if (!IniFile.Load("\\config.ini"))
	{
		Error_SetErrorCode(ERR_T_FILE_NO_FOUND);
		Error_SetErrorString("\\config.ini");
		return FALSE;
	}

#ifdef _DEBUG
	BOOL		bCursor = FALSE;
	if (IniFile.GetInteger("Client", "ShowCursor", 0, &bCursor))
		ShowMouse(TRUE);
#endif

	IniFile.GetInteger("Client", "FullScreen", FALSE, &g_bScreen);

#ifdef DYNAMIC_LINK_REPRESENT_LIBRARY
	IniFile.GetInteger("Client", "Represent", 2, &g_bRepresent3);
	g_bRepresent3 = (g_bRepresent3 == 3);
#endif

	g_PakList.Open("\\Package.ini");

	char	szPath[MAX_PATH];
	if (IniFile.GetString("Client", "CapPath", "", szPath, sizeof(szPath)))
	{
		if (szPath[0])
			SetScrPicPath(szPath);
	}

	IniFile.Clear();

	if (!g_libFilterText.Initialize()
		|| !g_ChatFilter.Initialize())
		return FALSE;

	// Keep the window client area identical to the 960x720 software canvas.
	// Non-integer D3D scaling makes equal sprites differ by a pixel by position.
	SetStartupClientWindowSize(NEWINITSCREEN_W, NEWINITSCREEN_H, g_bScreen);

	if (!InitRepresentShell(g_bScreen, NEWINITSCREEN_W, NEWINITSCREEN_H))
	{
		return FALSE;
	}

	if (!UiInit())
	{
		Error_SetErrorCode(ERR_T_MODULE_INIT_FAILED);
		Error_SetErrorString("UiInit");
		return FALSE;
	}

	//[wxb 2003-6-23]
	m_pInlinePicSink = new KInlinePicSink;
    if (m_pInlinePicSink)
	{
		m_pInlinePicSink->Init(g_pRepresentShell);
		_ASSERT(NULL == g_pIInlinePicSink);
		g_pIInlinePicSink = m_pInlinePicSink;
	}

	UiSetScreenSize(NEWINITSCREEN_W, NEWINITSCREEN_H);

	UiPaint(0);

	// init dsound
	m_Sound.Init();

	SetMultiGame(TRUE);

	if ((g_pCoreShell = CoreGetShell()) == NULL)
	{
		Error_SetErrorCode(ERR_T_MODULE_INIT_FAILED);
		Error_SetErrorString("CoreGetShell");
		return false;
	}
	g_pCoreShell->SetRepresentShell(g_pRepresentShell);
	g_pCoreShell->SetMusicInterface((KMusic*)&m_Music);
	g_pCoreShell->SetCallDataChangedNofify(&g_ClientCallback);
	g_pCoreShell->SetRepresentAreaSize(NEWINITSCREEN_W, NEWINITSCREEN_H);
	
	g_pMusic = &m_Music;

	if (g_NetConnectAgent.Initialize() == 0)
	{
		Error_SetErrorCode(ERR_T_MODULE_INIT_FAILED);
		Error_SetErrorString("NetConnectAgent");
		return FALSE;
	}

	m_GameCounter = 0;
	m_Timer.Start();
	
	SetMouseHoverTime(400);

	if(UiStart())
	{
		return TRUE;
	}
	else
	{
		Error_SetErrorCode(ERR_T_MODULE_INIT_FAILED);
		Error_SetErrorString("UiStart");
		return FALSE;
	}
}

BOOL KMyApp::GameExit()
{
	// Stop network callbacks before destroying their Core/UI targets.
	g_NetConnectAgent.Exit();

	if (m_pInlinePicSink)
	{
		//[wxb 2003-6-23]
		m_pInlinePicSink->UnInit();
		delete m_pInlinePicSink;
		m_pInlinePicSink = NULL;
		g_pIInlinePicSink = NULL;
	}

	UiExit();

	g_pMusic = NULL;
	if (g_pCoreShell)
	{
		g_pCoreShell->SetRepresentShell(NULL);
		g_pCoreShell->SetClient(NULL);
		g_pCoreShell->SetMusicInterface(NULL);
		g_pCoreShell->Release();
		g_pCoreShell = NULL;
	}

	if (g_pRepresentShell)
	{
		g_pRepresentShell->Release();
		g_pRepresentShell = NULL;
	}

	m_Music.Close();
	m_Sound.Exit();

#ifdef DYNAMIC_LINK_REPRESENT_LIBRARY
	if (l_hRepresentModule)
	{
		FreeLibrary(l_hRepresentModule);
		l_hRepresentModule = NULL;
	}
#endif

	::ShowCursor(TRUE);

	g_ChatFilter.Uninitialize();
	g_libFilterText.Uninitialize();

	return TRUE;
}

BOOL KMyApp::GameLoop()
{
    static unsigned int uGameLoops = 0;
    static LARGE_INTEGER s_qpcFrequency = { 0 };
    static LONGLONG s_qpcNextPaint = 0;
    static LONGLONG s_qpcLastPaint = 0;

    if (s_qpcFrequency.QuadPart == 0)
        QueryPerformanceFrequency(&s_qpcFrequency);

    g_NetConnectAgent.Breathe();

    unsigned int uNowTimeElapse = m_Timer.GetElapse();
    unsigned int uNeedGameFrames =
        (unsigned int)(((unsigned __int64)uNowTimeElapse * GAME_FPS) / 1000);

    // Fixed 18 Hz simulation, caught up against the absolute client timer.
    while (m_GameCounter < uNeedGameFrames)
    {
        if (!g_pCoreShell)
            return FALSE;

        if (!g_pCoreShell->Breathe())
            return FALSE;

        IR_UpdateTime();
        UiHeartBeat();

        if (uNeedGameFrames > m_GameCounter + GAME_FPS * 100)
            m_GameCounter = uNeedGameFrames;
        else
            ++m_GameCounter;
        ++uGameLoops;
    }

    LARGE_INTEGER qpcNow;
    QueryPerformanceCounter(&qpcNow);
    const int nPaintFps = PAINT_FPS_2D;
    const LONGLONG qpcFrameTicks =
        (s_qpcFrequency.QuadPart + nPaintFps / 2) / nPaintFps;

    if (s_qpcNextPaint == 0)
        s_qpcNextPaint = qpcNow.QuadPart;

    if (qpcNow.QuadPart >= s_qpcNextPaint)
    {
        if (s_qpcLastPaint)
        {
            const unsigned int gap = (unsigned int)
                (((qpcNow.QuadPart - s_qpcLastPaint) * 1000) /
                 s_qpcFrequency.QuadPart);
            if (gap >= 28)
                FPS60ClientDiagLog("PAINT_SCHEDULER_GAP dt=%u loops=%u fps=%d",
                    gap, uGameLoops, nPaintFps);
        }
        s_qpcLastPaint = qpcNow.QuadPart;

        UiPaint((int)uGameLoops);

        s_qpcNextPaint += qpcFrameTicks;
        if (qpcNow.QuadPart - s_qpcNextPaint > qpcFrameTicks * 4)
            s_qpcNextPaint = qpcNow.QuadPart + qpcFrameTicks;
        else
            while (s_qpcNextPaint <= qpcNow.QuadPart)
                s_qpcNextPaint += qpcFrameTicks;
    }

    // Sleep for most of the remaining interval, leaving a one millisecond
    // tail exactly as the optimized reference scheduler does.
    QueryPerformanceCounter(&qpcNow);
    const LONGLONG qpcRemain = s_qpcNextPaint - qpcNow.QuadPart;
    if (qpcRemain > 0)
    {
        DWORD remainMs = (DWORD)
            ((qpcRemain * 1000) / s_qpcFrequency.QuadPart);
        if (remainMs > 16)
            remainMs = 16;
        // Represent2 rasterization normally consumes 15-16 ms. A forced
        // Sleep(1) in the sub-2 ms tail creates the measured 31-32 ms gap.
        // Yield without adding another timer quantum.
        Sleep((remainMs >= 2) ? (remainMs - 1) : 0);
    }
    else
    {
        Sleep(0);
    }

    return TRUE;
}

int KMyApp::HandleInput(UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	int nRet = 0;
	if (uMsg != WM_CLOSE)
	{
		UiProcessInput(uMsg, wParam, lParam);
	}
	else if (g_bScreen == false && UiIsAlreadyQuit() == false)
	{
		KIniFile*	pSetting = g_UiBase.GetCommConfigFile();
		if (pSetting)
		{
			char	szMsg[128], szTitle[64];
			pSetting->GetString("InfoString", QUIT_QUESTION_ID, "", szMsg, sizeof(szMsg));
			pSetting->GetString("InfoString", GAME_TITLE, "", szTitle, sizeof(szTitle));
			if (szMsg[0] && szTitle[0])
			{
				nRet = (MessageBox(g_GetMainHWnd(), szMsg, szTitle,
					MB_YESNO | MB_ICONQUESTION) != IDYES);
			}
		}
	}
	return nRet;
}
