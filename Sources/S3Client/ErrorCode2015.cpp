#include "KWin32.h"
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include "ErrorCode.h"

static void JxInvalidParameterHandler(
    const wchar_t*, const wchar_t*, const wchar_t*, unsigned int, uintptr_t)
{
    // VC6 ignored these legacy CRT argument violations.  Keep that behavior
    // for the upgraded client instead of invoking the VS2015 UCRT fail-fast.
}

class JxCrtCompatibility
{
public:
    JxCrtCompatibility() { _set_invalid_parameter_handler(JxInvalidParameterHandler); }
};

static JxCrtCompatibility s_jxCrtCompatibility;

// VS2015-safe replacement for the VC6 ErrorCode.cpp formatter.  The original
// passed a string loaded from game data directly to sprintf; modern UCRT
// treats malformed format sequences as a fatal invalid-parameter error.
static unsigned int s_uErrorCode = 0;
static char s_szErrorString[32] = "";

void Error_SetErrorCode(unsigned int uCode)
{
    s_uErrorCode = uCode;
}

void Error_SetErrorString(const char* pcszString)
{
    if (!pcszString)
        pcszString = "";
    strncpy_s(s_szErrorString, sizeof(s_szErrorString), pcszString, _TRUNCATE);
}

void Error_Box()
{
    if (s_uErrorCode)
    {
        char szOutputInfo[512];
        _snprintf_s(szOutputInfo, sizeof(szOutputInfo), _TRUNCATE,
            "Game initialization failed.\r\nError code: %u\r\nContext: %s",
            s_uErrorCode, s_szErrorString);
        MessageBoxA(NULL, szOutputInfo, "JX Client", MB_OK | MB_ICONERROR);
        s_uErrorCode = 0;
    }
    s_szErrorString[0] = 0;
}
