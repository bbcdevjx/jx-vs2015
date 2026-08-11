#include "KWin32.h"
#include "KWin32Wnd.h"
#include "../../Engine/Src/KIniFile.h"
#include "../Elem/WndMessage.h"
#include "Wnds.h"
#include "WndEdit.h"

namespace
{
	struct Tcvn3Map { wchar_t unicode; unsigned char first; unsigned char second; };

	static const Tcvn3Map s_tcvn3[] =
	{
		{0x00C0,'A',0xB5},{0x00C1,'A',0xB8},{0x00C2,0xA2,0},{0x00C3,'A',0xB7},
		{0x00C8,'E',0xCC},{0x00C9,'E',0xD0},{0x00CA,0xA3,0},{0x00CC,'I',0xD7},
		{0x00CD,'I',0xDD},{0x00D2,'O',0xDF},{0x00D3,'O',0xE3},{0x00D4,0xA4,0},
		{0x00D5,'O',0xE2},{0x00D9,'U',0xEF},{0x00DA,'U',0xF3},{0x00DD,'Y',0xFD},
		{0x00E0,0xB5,0},{0x00E1,0xB8,0},{0x00E2,0xA9,0},{0x00E3,0xB7,0},
		{0x00E8,0xCC,0},{0x00E9,0xD0,0},{0x00EA,0xAA,0},{0x00EC,0xD7,0},
		{0x00ED,0xDD,0},{0x00F2,0xDF,0},{0x00F3,0xE3,0},{0x00F4,0xAB,0},
		{0x00F5,0xE2,0},{0x00F9,0xEF,0},{0x00FA,0xF3,0},{0x00FD,0xFD,0},
		{0x0102,0xA1,0},{0x0103,0xA8,0},{0x0110,0xA7,0},{0x0111,0xAE,0},
		{0x0128,'I',0xDC},{0x0129,0xDC,0},{0x0168,'U',0xF2},{0x0169,0xF2,0},
		{0x01A0,0xA5,0},{0x01A1,0xAC,0},{0x01AF,0xA6,0},{0x01B0,0xAD,0},
		{0x1EA0,'A',0xB9},{0x1EA1,0xB9,0},{0x1EA2,'A',0xB6},{0x1EA3,0xB6,0},
		{0x1EA4,0xA2,0xCA},{0x1EA5,0xCA,0},{0x1EA6,0xA2,0xC7},{0x1EA7,0xC7,0},
		{0x1EA8,0xA2,0xC8},{0x1EA9,0xC8,0},{0x1EAA,0xA2,0xC9},{0x1EAB,0xC9,0},
		{0x1EAC,0xA2,0xCB},{0x1EAD,0xCB,0},{0x1EAE,0xA1,0xBE},{0x1EAF,0xBE,0},
		{0x1EB0,0xA1,0xBB},{0x1EB1,0xBB,0},{0x1EB2,0xA1,0xBC},{0x1EB3,0xBC,0},
		{0x1EB4,0xA1,0xBD},{0x1EB5,0xBD,0},{0x1EB6,0xA1,0xC6},{0x1EB7,0xC6,0},
		{0x1EB8,'E',0xD1},{0x1EB9,0xD1,0},{0x1EBA,'E',0xCE},{0x1EBB,0xCE,0},
		{0x1EBC,'E',0xCF},{0x1EBD,0xCF,0},{0x1EBE,0xA3,0xD5},{0x1EBF,0xD5,0},
		{0x1EC0,0xA3,0xD2},{0x1EC1,0xD2,0},{0x1EC2,0xA3,0xD3},{0x1EC3,0xD3,0},
		{0x1EC4,0xA3,0xD4},{0x1EC5,0xD4,0},{0x1EC6,0xA3,0xD6},{0x1EC7,0xD6,0},
		{0x1EC8,'I',0xD8},{0x1EC9,0xD8,0},{0x1ECA,'I',0xDE},{0x1ECB,0xDE,0},
		{0x1ECC,'O',0xE4},{0x1ECD,0xE4,0},{0x1ECE,'O',0xE1},{0x1ECF,0xE1,0},
		{0x1ED0,0xA4,0xE8},{0x1ED1,0xE8,0},{0x1ED2,0xA4,0xE5},{0x1ED3,0xE5,0},
		{0x1ED4,0xA4,0xE6},{0x1ED5,0xE6,0},{0x1ED6,0xA4,0xE7},{0x1ED7,0xE7,0},
		{0x1ED8,0xA4,0xE9},{0x1ED9,0xE9,0},{0x1EDA,0xA5,0xED},{0x1EDB,0xED,0},
		{0x1EDC,0xA5,0xEA},{0x1EDD,0xEA,0},{0x1EDE,0xA5,0xEB},{0x1EDF,0xEB,0},
		{0x1EE0,0xA5,0xEC},{0x1EE1,0xEC,0},{0x1EE2,0xA5,0xEE},{0x1EE3,0xEE,0},
		{0x1EE4,'U',0xF4},{0x1EE5,0xF4,0},{0x1EE6,'U',0xF1},{0x1EE7,0xF1,0},
		{0x1EE8,0xA6,0xF8},{0x1EE9,0xF8,0},{0x1EEA,0xA6,0xF5},{0x1EEB,0xF5,0},
		{0x1EEC,0xA6,0xF6},{0x1EED,0xF6,0},{0x1EEE,0xA6,0xF7},{0x1EEF,0xF7,0},
		{0x1EF0,0xA6,0xF9},{0x1EF1,0xF9,0},{0x1EF2,'Y',0xFA},{0x1EF3,0xFA,0},
		{0x1EF4,'Y',0xFE},{0x1EF5,0xFE,0},{0x1EF6,'Y',0xFB},{0x1EF7,0xFB,0},
		{0x1EF8,'Y',0xFC},{0x1EF9,0xFC,0}
	};

	static const Tcvn3Map* FindTcvn3(wchar_t ch)
	{
		for (int i = 0; i < (int)(sizeof(s_tcvn3) / sizeof(s_tcvn3[0])); ++i)
			if (s_tcvn3[i].unicode == ch)
				return &s_tcvn3[i];
		return NULL;
	}

	static bool Tcvn3ToUnicode(const char* text, int pos, int textLen,
		wchar_t& unicode, int& byteCount)
	{
		if (text == NULL || pos < 0 || pos >= textLen)
			return false;

		const unsigned char first = (unsigned char)text[pos];
		if (pos + 1 < textLen)
		{
			const unsigned char second = (unsigned char)text[pos + 1];
			for (int i = 0; i < (int)(sizeof(s_tcvn3) / sizeof(s_tcvn3[0])); ++i)
				if (s_tcvn3[i].second && s_tcvn3[i].first == first &&
					s_tcvn3[i].second == second)
				{
					unicode = s_tcvn3[i].unicode;
					byteCount = 2;
					return true;
				}
		}

		for (int i = 0; i < (int)(sizeof(s_tcvn3) / sizeof(s_tcvn3[0])); ++i)
			if (s_tcvn3[i].second == 0 && s_tcvn3[i].first == first)
			{
				unicode = s_tcvn3[i].unicode;
				byteCount = 1;
				return true;
			}
		return false;
	}

	static bool IsTcvn3Pair(unsigned char first, unsigned char second)
	{
		for (int i = 0; i < (int)(sizeof(s_tcvn3) / sizeof(s_tcvn3[0])); ++i)
			if (s_tcvn3[i].second &&
				s_tcvn3[i].first == first && s_tcvn3[i].second == second)
				return true;
		return false;
	}

	static int Tcvn3NextCharLen(const char* text, int pos, int textLen)
	{
		if (text && pos >= 0 && pos + 1 < textLen &&
			IsTcvn3Pair((unsigned char)text[pos], (unsigned char)text[pos + 1]))
			return 2;
		return 1;
	}

	static int Tcvn3PrevCharPos(const char* text, int pos)
	{
		if (text == NULL || pos <= 0)
			return 0;
		if (pos >= 2 &&
			IsTcvn3Pair((unsigned char)text[pos - 2], (unsigned char)text[pos - 1]))
			return pos - 2;
		return pos - 1;
	}

	static int Tcvn3VisualCharCount(const char* text, int begin, int end)
	{
		if (text == NULL || begin < 0 || end <= begin)
			return 0;
		int count = 0;
		for (int pos = begin; pos < end; ++count)
		{
			if (pos + 1 < end &&
				IsTcvn3Pair((unsigned char)text[pos], (unsigned char)text[pos + 1]))
				pos += 2;
			else
				++pos;
		}
		return count;
	}

	static int MakeEditDisplayText(const char* source, int length,
		char* output, int outputSize)
	{
		if (source == NULL || output == NULL || outputSize <= 0)
			return 0;
		if (length > outputSize - 1)
			length = outputSize - 1;
		for (int i = 0; i < length; ++i)
			output[i] = ((unsigned char)source[i] == 0xD9) ? ' ' : source[i];
		output[length] = 0;
		return length;
	}
}
#include "KIme.h"
#include "Text.h"
#include "../../../Represent/iRepresent/KRepresentUnit.h"
#include "../../../Represent/iRepresent/iRepresentShell.h"
extern iRepresentShell*	g_pRepresentShell;

static KIme	s_Ime;
static BOOL	s_LastTimeIsIme;


#define	MULTI_LINE	(m_Flag & WNDEDIT_ES_MULTI_LINE)

int SplitStringLine(char* pString, int nLine, int nLineByte);

KWndEdit::KWndEdit()
{
	m_Flag = WNDEDIT_ES_ENGLISH_AVAILABLE;
	m_nBufferSize	= 0;
	m_nLimitText	= 0;
	m_nTextLen		= 0;

	m_nSkipAhead    = 0;
	m_nSkipBehind   = 0;
	m_nCaretLineIndex = 0;
	m_nCaretPos     = 0;
	m_nCaretTime    = 0;
	m_nFontSize		= 12;

	m_TextBorderColor = 0;
	m_FocusBkColor = 0;

    //m_hEdit = NULL;
}

KWndEdit::~KWndEdit()
{
    //if (m_hEdit)
    //{
    //    DestroyWindow(m_hEdit);
    //    m_hEdit = NULL;
    //}
}


void KWndEdit::Clone(KWndEdit* pCopy)
{
	if (pCopy)
	{
		KWndWindow::Clone(pCopy);
		pCopy->m_Flag = m_Flag & WNDEDIT_ES_FILTER;
		pCopy->m_nLimitText	= m_nLimitText;
		pCopy->m_TextColor	= m_TextColor;
		pCopy->m_nFontSize	= m_nFontSize;
		pCopy->m_TextBorderColor = m_TextBorderColor;
		pCopy->m_FocusBkColor = m_FocusBkColor;
		FmtForShow();
	}
}

int KWndEdit::Init(KIniFile* pIniFile, const char* pSection)
{
	if (KWndWindow::Init(pIniFile, pSection))
	{
		int	nValue;
		pIniFile->GetInteger(pSection, "MultiLine", 0, &nValue);
		if (nValue)
		{
			m_Flag |= WNDEDIT_ES_MULTI_LINE;
			m_nSkipAhead = 0;
		}
		else
		{
			m_Flag &= ~WNDEDIT_ES_MULTI_LINE;
			m_nCaretLineIndex = 0;
		}

		pIniFile->GetInteger(pSection, "Password", 0, &nValue);
		if (nValue)
		{
			m_Flag |= WNDEDIT_ES_MASK_CHARACTER;
			m_Flag &= ~WNDEDIT_ES_MULTI_LINE;
		}
		else
		{
			m_Flag &= ~WNDEDIT_ES_MASK_CHARACTER;
		}

		m_Flag &= ~WNDEDIT_ES_CHAR_TYPE_FILTER;
		pIniFile->GetInteger(pSection, "Type", 0, &nValue);
		if (nValue == 1)
			m_Flag |= WNDEDIT_ES_ENGLISH_AVAILABLE;
		else if (nValue == 2)
			m_Flag |= WNDEDIT_ES_IME_AVAILABLE;


		pIniFile->GetInteger(pSection, "MaxLen", -1, &m_nLimitText);
		if (m_nLimitText > m_nBufferSize - 1 || m_nLimitText == -1)
			m_nLimitText = m_nBufferSize -1;
		if (m_nLimitText < 0)
			m_nLimitText = 0;		

		char	Buff[16];
		pIniFile->GetString(pSection, "Color", "", Buff, 16);
		m_TextColor = GetColor(Buff);
		pIniFile->GetString(pSection, "BorderColor", "", Buff, 16);
		m_TextBorderColor = GetColor(Buff);
		//====文字大小====
		pIniFile->GetInteger(pSection, "Font", 12, &m_nFontSize);
		if (m_nFontSize < 8)
			m_nFontSize = 12;
		if (m_Width < m_nFontSize)
		{
			if (m_Flag & WNDEDIT_ES_IME_AVAILABLE)
				m_Width = m_nFontSize;
			else
				m_Width = m_nFontSize / 2;
		}
		if (m_Height < m_nFontSize + 1)
			m_Height = m_nFontSize + 1;

		pIniFile->GetString(pSection, "FocusBKColor", "0,0,0", Buff, sizeof(Buff));
		m_FocusBkColor = (GetColor(Buff) & 0xffffff);
		if (pIniFile->GetInteger(pSection, "FocusBKColorAlpha", 128, &nValue))
		{
			if (nValue > 255 || nValue < 0)
				m_FocusBkColor |= 0x16000000;
			else
				m_FocusBkColor |= (((255 - nValue) << 21) & 0xff000000);
		}

		FmtForShow();
		return true;
	}
	return false;
}

void KWndEdit::Enable(int bEnable)
{
	if (bEnable)
	{
		m_Style &= ~WND_S_DISABLE;
	}
	else
	{
		if (m_Flag & WNDEDIT_F_HAVE_FOCUS)
			Wnd_SetFocusWnd(NULL);
		m_Style |= WND_S_DISABLE;
	}
}

int KWndEdit::WndProc(unsigned int uMsg, unsigned int uParam, int nParam)
{
	int	nRet = 0;
	switch(uMsg)
	{
	case WM_LBUTTONDOWN:
	case WM_RBUTTONDOWN:
		if (IsVisible() && Wnd_GetFocusWnd() != (KWndWindow*)this)
		{
			Wnd_SetFocusWnd((KWndWindow*)this);
		}
		else
			nRet = KWndWindow::WndProc(uMsg, uParam, nParam);
		break;
	case WM_IME_CHAR:
	case WM_CHAR:
		if ((m_Flag & WNDEDIT_F_HAVE_FOCUS) && ((m_Style & WND_S_DISABLE) == 0))
		{
			if (InsertUnicodeChar((wchar_t)uParam))
				UpdateData();
			nRet = 1;
		}
		break;
	case WM_KEYDOWN:
		if (!IsDisable())
			nRet = OnKeyDown(uParam, nParam);
		break;
	case WND_M_SET_FOCUS:
		if (m_pText)
		{
			if (m_Flag & WNDEDIT_ES_IME_AVAILABLE)
			{
				s_Ime.EnableLanguageChange();
				if (s_LastTimeIsIme)
				    s_Ime.OpenIME();
			}

			m_Flag |= WNDEDIT_F_HAVE_FOCUS;
			m_nCaretTime = 0;

      m_nCaretX = m_nAbsoluteLeft;
      m_nCaretY = m_nAbsoluteTop;
      SetCaretPos(m_nCaretX, m_nCaretY);
      s_Ime.SetCaretPos(m_nCaretX, m_nCaretY);
		}
		break;
	case WND_M_KILL_FOCUS:

		if (m_Flag & WNDEDIT_ES_IME_AVAILABLE)
			s_LastTimeIsIme = s_Ime.IsIme();
		s_Ime.DisableLanguageChange();
		s_Ime.CloseIME();
		m_Flag &= ~WNDEDIT_F_HAVE_FOCUS;
		break;
	case WM_SYSKEYDOWN:
		if (m_pParentWnd)
			nRet = m_pParentWnd->WndProc(uMsg, uParam, nParam);
		break;
	case WM_MOUSEWHEEL:
		if (!IsDisable())
		{
			int zDelta = short(HIWORD(uParam));
			if (zDelta != 0)
				nRet = OnKeyDown(zDelta < 0 ? VK_DOWN : VK_UP, 0);
		}
		break;
	default:
		nRet = KWndWindow::WndProc(uMsg, uParam, nParam);
		break;
	}
	return nRet;
}

void KWndEdit::SetColor(unsigned int uColor)
{
	m_TextColor = uColor;
}

int KWndEdit::InsertString(const char* pString, int nLen)
{
	int bInserted = false;
	if (pString)
	{
		if (nLen < 0)
			nLen = strlen(pString);
		for (int nPos = 0; nPos < nLen; )
		{
			const unsigned char value = (unsigned char)pString[nPos];
			wchar_t unicode = 0;
			int byteCount = 1;

			// 0xD9 is the server-side role-name separator. Keep it in storage;
			// PaintWindow renders it as a normal space only inside edit controls.
			if (value == 0xD9)
			{
				if (InsertChar((char)value, 0))
					bInserted = true;
			}
			else if (value < 0x80)
			{
				if (InsertUnicodeChar((wchar_t)value))
					bInserted = true;
			}
			else if (Tcvn3ToUnicode(pString, nPos, nLen, unicode, byteCount))
			{
				if (InsertUnicodeChar(unicode))
					bInserted = true;
			}
			else if (InsertChar((char)value, 0))
			{
				bInserted = true;
			}
			nPos += byteCount;
		}
		if (bInserted)
			FmtForShow();
	}
	return bInserted;
}

int KWndEdit::Paste()
{
	int bPasted = false;
	if (OpenClipboard(NULL))
	{
		HANDLE	hData = GetClipboardData(CF_UNICODETEXT);
		if (hData)
		{
			const wchar_t* pText = (const wchar_t*)GlobalLock(hData);
			if (pText)
			{
				bPasted = InsertUnicodeString(pText, lstrlenW(pText));
				GlobalUnlock(hData);
			}
		}
		else
		{
			hData = GetClipboardData(CF_TEXT);
			if (hData)
			{
				const char* pText = (const char*)GlobalLock(hData);
				if (pText)
				{
					bPasted = InsertString(pText, -1);
					GlobalUnlock(hData);
				}
			}
		}
		if (m_Flag & WNDEDIT_ES_MASK_CHARACTER)
			EmptyClipboard();
		CloseClipboard();
	}
	return bPasted;
}

int KWndEdit::OnKeyDown(int nKeyCode, int nModifiers)
{
	int nRet = 1;
	switch(nKeyCode)
	{
	case VK_DELETE:
		if (m_nCaretPos < m_nTextLen)
		{
			int nNextPos = Tcvn3NextCharLen(m_pText, m_nCaretPos, m_nTextLen);
			m_nTextLen -= nNextPos;
			memmove(m_pText + m_nCaretPos, m_pText + m_nCaretPos + nNextPos, m_nTextLen - m_nCaretPos + 1);
			UpdateData();
		}
		break;
	case VK_LEFT:
		if (m_nCaretPos)
		{
			m_nCaretPos = Tcvn3PrevCharPos(m_pText, m_nCaretPos);
			FmtForShow();
		}
		break;
	case VK_RIGHT:
		if (m_nCaretPos < m_nTextLen)
		{
			m_nCaretPos += Tcvn3NextCharLen(m_pText, m_nCaretPos, m_nTextLen);
			FmtForShow();
		}
		break;
	case VK_HOME:
		m_nCaretPos = 0;
		FmtForShow();
		break;
	case VK_END:
		m_nCaretPos = m_nTextLen;
		FmtForShow();
		break;
	case VK_UP:
		if (MULTI_LINE && m_nCaretLineIndex)
		{
			int nCharPerLine = (m_Width * 2) / m_nFontSize;
			int nLineHead = 0, nLineEnd = 0;
			for (nRet = 0; nRet < m_nCaretLineIndex; nRet++)
			{
				nLineHead = nLineEnd;
				nLineEnd = nLineHead + SplitStringLine(&m_pText[nLineHead], 1, nCharPerLine);
			}

			m_nCaretPos = nLineHead + TSplitString(&m_pText[nLineHead],
				(m_nCaretPos - nLineEnd), false);
			if (m_nCaretPos >= nLineEnd && nLineEnd)
			{
				m_nCaretPos = nLineEnd;
				if(m_pText[nLineEnd - 1] == KTC_ENTER)
					m_nCaretPos--;
			}
			FmtForShow();
		}
		else if (m_pParentWnd)
			nRet = m_pParentWnd->WndProc(WND_N_EDIT_SPECIAL_KEY_DOWN, (unsigned int)(KWndWindow*)this, VK_UP);
		break;
	case VK_DOWN:
		if (MULTI_LINE)
		{
			int nCharPerLine = (m_Width * 2) / m_nFontSize;
			int nLineHead = 0, nLineEnd = 0;
			for (nRet = 0; nRet <= m_nCaretLineIndex; nRet++)
			{
				nLineHead = nLineEnd;
				nLineEnd = nLineHead + SplitStringLine(&m_pText[nLineHead], 1, nCharPerLine);
			}

			m_nCaretPos = nLineEnd + TSplitString(&m_pText[nLineEnd],
				(m_nCaretPos - nLineHead), false);
			nLineHead = nLineEnd;
			nLineEnd = nLineHead + SplitStringLine(&m_pText[nLineHead], 1, nCharPerLine);
			if (m_nCaretPos >= nLineEnd && nLineEnd)
			{
				m_nCaretPos = nLineEnd;
				if(m_pText[nLineEnd - 1] == KTC_ENTER)
					m_nCaretPos--;
			}
			FmtForShow();
		}
		else if (m_pParentWnd)
			nRet = m_pParentWnd->WndProc(WND_N_EDIT_SPECIAL_KEY_DOWN, (unsigned int)(KWndWindow*)this, VK_DOWN);
		break;
	case VK_TAB:
	case VK_PRIOR:
	case VK_NEXT:
	case VK_ESCAPE:
		if (m_pParentWnd)
			nRet = m_pParentWnd->WndProc(WND_N_EDIT_SPECIAL_KEY_DOWN, (unsigned int)(KWndWindow*)this, nKeyCode);
		break;
	case VK_RETURN:
		if (m_pParentWnd)
		{
			if ((m_Flag & WNDEDIT_ES_MULTI_LINE) == 0)
				nRet = m_pParentWnd->WndProc(WND_N_EDIT_SPECIAL_KEY_DOWN, (unsigned int)(KWndWindow*)this, VK_RETURN);
			else if ((GetKeyState(VK_CONTROL) & 0x8000) == 0 && (GetKeyState(VK_SHIFT) & 0x8000) == 0)
				nRet = m_pParentWnd->WndProc(WND_N_EDIT_SPECIAL_KEY_DOWN, (unsigned int)(KWndWindow*)this, VK_RETURN);
			else if (InsertChar(0x0a, 0))
			{
				UpdateData();
				nRet = 1;
			}
		}
		break;
	case 'V':	//粘帖
		if ((GetKeyState(VK_CONTROL) & 0x8000) && Paste())
			nRet = 1;
		break;
	case VK_SPACE:
	case VK_BACK:
		return 1;
	default:
		if ((nKeyCode < '0' || nKeyCode > '9') &&
			(nKeyCode < 'A' || nKeyCode > 'Z') &&
			(nKeyCode < VK_NUMPAD0 || nKeyCode > VK_DIVIDE))
		{
			nRet = 0;
		}			
	}
	return nRet;
}

int KWndEdit::InsertChar(int nChar)
{
	if (nChar == VK_BACK)	
	{
		if (m_nCaretPos)
		{
			int nPrioPos = Tcvn3PrevCharPos(m_pText, m_nCaretPos);
			memmove(m_pText + nPrioPos, m_pText + m_nCaretPos, m_nTextLen - m_nCaretPos + 1);
			m_nTextLen -= m_nCaretPos - nPrioPos;
			m_nCaretPos = nPrioPos;
			return true;
		}
	}
	else if (nChar >= ' ' /*&& nChar <= '~'*/)
	{
		if ((m_Flag & WNDEDIT_ES_CHAR_TYPE_FILTER) || (nChar >= '0' && nChar <= '9'))
			return (InsertChar((char)(nChar & 0xff), 0));
	}
	return false;
}

int KWndEdit::InsertUnicodeChar(wchar_t nChar)
{
	if (nChar < 0x80)
		return InsertChar((int)nChar);

	if (nChar == 0x00D9)
		return InsertChar((char)0xD9, 0);

	if ((m_Flag & WNDEDIT_ES_IME_AVAILABLE) == 0)
		return false;

	const Tcvn3Map* pMap = FindTcvn3(nChar);
	if (pMap == NULL)
		return false;

	if (pMap->second)
		return InsertChar((char)pMap->second, (char)pMap->first);
	return InsertChar((char)pMap->first, 0);
}

int KWndEdit::InsertUnicodeString(const wchar_t* pString, int nLen)
{
	int bInserted = false;
	if (pString == NULL)
		return false;

	for (int i = 0; i < nLen; ++i)
		if (InsertUnicodeChar(pString[i]))
			bInserted = true;

	if (bInserted)
		FmtForShow();
	return bInserted;
}

int	KWndEdit::InsertChar(char cLow, char cHigh)
{
	int	nLen = cHigh ? 2 : 1;
	if (m_nCaretPos + nLen <= m_nLimitText)
	{
		if (m_nTextLen + nLen > m_nLimitText)
		{
			m_nTextLen = m_nCaretPos + TSplitString(m_pText + m_nCaretPos, m_nLimitText - nLen - m_nCaretPos, true);
			m_pText[m_nTextLen] = 0;
		}
		memmove(m_pText + m_nCaretPos + nLen, m_pText + m_nCaretPos, m_nTextLen - m_nCaretPos + 1);
		if (cHigh)
			m_pText[m_nCaretPos++] = cHigh;
		m_pText[m_nCaretPos++] = cLow;
		m_nTextLen += nLen;
		return 1;
	}
	return 0;
}

void KWndEdit::UpdateData()
{
	FmtForShow();
	if (m_pParentWnd)
	{	//发送更新消息
		m_pParentWnd->WndProc(WND_N_EDIT_CHANGE, (unsigned int)(KWndWindow*)this, 0);
	}
}

void KWndEdit::FmtForShow()
{	
	if (m_pText == NULL)
	return;
	int	nLineLen = (m_Width * 2) / m_nFontSize;
	if ((m_Flag & WNDEDIT_ES_MULTI_LINE) == 0)
	{
		int nJumpLen = 4;
		if (nLineLen < nJumpLen + 2)
			nJumpLen = 1;
		if (m_nCaretPos < m_nSkipAhead)
			m_nSkipAhead = TSplitString(m_pText, m_nCaretPos - nJumpLen, true);
		else if (m_nCaretPos > m_nSkipAhead + nLineLen - 1)
			m_nSkipAhead = TSplitString(m_pText, m_nCaretPos + nJumpLen - nLineLen, false);
		if (m_nSkipAhead + nLineLen >= m_nTextLen)
			m_nSkipBehind = -1;
		else
			m_nSkipBehind = m_nSkipAhead + TSplitString(m_pText + m_nSkipAhead, nLineLen, true);
	}
	else
	{
		int	nLine = m_Height / (m_nFontSize + 1);
		if (m_nCaretPos < m_nSkipAhead)
		{
			m_nSkipBehind = 0;
			do
			{
				m_nSkipAhead = m_nSkipBehind;
				m_nSkipBehind = m_nSkipAhead + SplitStringLine(m_pText + m_nSkipAhead, 1, nLineLen);
			}while(m_nSkipBehind < m_nCaretPos);
		}
		m_nSkipBehind = m_nSkipAhead + SplitStringLine(m_pText + m_nSkipAhead, nLine, nLineLen);
		while (m_nCaretPos > m_nSkipBehind)
		{
			m_nSkipAhead = m_nSkipAhead + SplitStringLine(m_pText + m_nSkipAhead, 1, nLineLen);
			m_nSkipBehind = m_nSkipAhead + SplitStringLine(m_pText + m_nSkipAhead, nLine, nLineLen);
		}
		m_nCaretLineIndex = 0;
		int nLineHead = 0, nLineEnd = 0;
		while(true)
		{
			nLineHead = nLineEnd;
			nLineEnd = nLineHead + SplitStringLine(&m_pText[nLineHead], 1, nLineLen);
			if (nLineEnd >= m_nCaretPos)
				break;
			m_nCaretLineIndex ++;
		};
		if (m_nCaretPos > 0 && m_pText[m_nCaretPos -1] == KTC_ENTER)
		{
			m_nCaretLineIndex ++;
			int nTemp = m_nSkipAhead + SplitStringLine(m_pText + m_nSkipAhead, nLine - 1, nLineLen);
			if (nTemp < m_nSkipBehind)
			{
				m_nSkipAhead = m_nSkipAhead + SplitStringLine(m_pText + m_nSkipAhead, 1, nLineLen);
				m_nSkipBehind = m_nSkipAhead + SplitStringLine(m_pText + m_nSkipAhead, nLine, nLineLen);
			}
		}
	}
}

int SplitStringLine(char* pString, int nLine, int nLineByte)
{
	int nPos = 0;
	if (pString)
	{
		int nLineOffset = 0;
		while(pString[nPos])
		{
			nPos ++;
			if (pString[nPos - 1] == KTC_ENTER || (++nLineOffset) >= nLineByte)
			{
				if ((--nLine) == 0)
					break;
				nLineOffset = 0;
			}
		}
	}
	return nPos;
}

void KWndEdit::PaintWindow()
{
	KWndWindow::PaintWindow();

	if (m_pText == NULL)
		return;

	bool bShowCaret = false;
	if (m_Flag & WNDEDIT_F_HAVE_FOCUS)
	{
		if ( ++m_nCaretTime <= 10)
			bShowCaret = true;
		else if (m_nCaretTime >= 17)
			m_nCaretTime = 0;

		if (m_FocusBkColor && g_pRepresentShell)
		{
			KRUShadow	Shadow;
			Shadow.oPosition.nX = m_nAbsoluteLeft;
			Shadow.oPosition.nY = m_nAbsoluteTop;
			Shadow.oEndPos.nX = m_nAbsoluteLeft + m_Width;
			Shadow.oEndPos.nY = m_nAbsoluteTop + m_Height;
			Shadow.Color.Color_dw = m_FocusBkColor;
			g_pRepresentShell->DrawPrimitives(1, &Shadow, RU_T_SHADOW, true);
		}
	}

	if (MULTI_LINE == 0)
	{
		int nLen;
		if (m_nSkipBehind < 0)
			nLen = m_nTextLen - m_nSkipAhead;
		else
			nLen = m_nSkipBehind - m_nSkipAhead;

		if ((m_Flag & WNDEDIT_ES_MASK_CHARACTER) == 0)
		{
			char displayText[513];
			nLen = MakeEditDisplayText(&m_pText[m_nSkipAhead], nLen,
				displayText, sizeof(displayText));
			g_pRepresentShell->OutputText(m_nFontSize, displayText, nLen,
					m_nAbsoluteLeft, m_nAbsoluteTop, m_TextColor, 0,
					TEXT_IN_SINGLE_PLANE_COORD, m_TextBorderColor);
		}
		else
		{
			int	x = m_nAbsoluteLeft;
			for (; nLen > 1; nLen -= 2, x += m_nFontSize)
				g_pRepresentShell->OutputText(m_nFontSize, "**", 2, x, m_nAbsoluteTop, m_TextColor,
					0, TEXT_IN_SINGLE_PLANE_COORD, m_TextBorderColor);
			if (nLen)
				g_pRepresentShell->OutputText(m_nFontSize, "*", 1, x, m_nAbsoluteTop, m_TextColor,
					0, TEXT_IN_SINGLE_PLANE_COORD, m_TextBorderColor);
		}
		if (bShowCaret)
		{   
			int nCaretX = m_nAbsoluteLeft +
				Tcvn3VisualCharCount(m_pText, m_nSkipAhead, m_nCaretPos) * m_nFontSize / 2 + 2;
			int nCaretY = m_nAbsoluteTop;

            if (
                (m_nCaretX != nCaretX) ||
                (m_nCaretY != nCaretY)
            )
            {
                m_nCaretX = nCaretX;
                m_nCaretY = nCaretY;
                SetCaretPos(m_nCaretX, m_nCaretY);
                s_Ime.SetCaretPos(m_nCaretX, m_nCaretY);
            }

            g_pRepresentShell->OutputText(m_nFontSize, "|", 1,
				nCaretX - m_nFontSize / 2, nCaretY, m_TextColor,
				0, TEXT_IN_SINGLE_PLANE_COORD, m_TextBorderColor);
		}
	}
	else
	{
		int	nLineBytes = (m_Width * 2) / m_nFontSize;
		int nLineAhead = m_nSkipAhead, nLineEnd;
		int y = m_nAbsoluteTop;
		do
		{
			nLineEnd  = nLineAhead + SplitStringLine(m_pText + nLineAhead, 1, nLineBytes);

			char displayText[513];
			int displayLen = MakeEditDisplayText(m_pText + nLineAhead,
				nLineEnd - nLineAhead, displayText, sizeof(displayText));
			g_pRepresentShell->OutputText(m_nFontSize, displayText, displayLen, m_nAbsoluteLeft, y,
				m_TextColor, m_Width, TEXT_IN_SINGLE_PLANE_COORD, m_TextBorderColor);
			
			if (bShowCaret && m_nCaretPos >= nLineAhead && m_nCaretPos <= nLineEnd)
			{
				int nCaretX, nCaretY;				

				if (m_nCaretPos == nLineEnd && m_nCaretPos > 0 && m_pText[m_nCaretPos - 1] == KTC_ENTER)
				{
					nCaretX = m_nAbsoluteLeft - m_nFontSize / 2 + 2;
					nCaretY = y + m_nFontSize + 1;
				}
				else
				{
					nCaretX = m_nAbsoluteLeft +
						(Tcvn3VisualCharCount(m_pText, nLineAhead, m_nCaretPos) - 1) * m_nFontSize / 2 + 2;
					nCaretY = y;
				}

                if (
                    (m_nCaretX != nCaretX) ||
                    (m_nCaretY != nCaretY)
                )
                {
                    m_nCaretX = nCaretX;
                    m_nCaretY = nCaretY;
                    SetCaretPos(m_nCaretX, m_nCaretY);
                    s_Ime.SetCaretPos(m_nCaretX, m_nCaretY);
                }

				g_pRepresentShell->OutputText(m_nFontSize, "|", 1, nCaretX, nCaretY, m_TextColor,
					0, TEXT_IN_SINGLE_PLANE_COORD, m_TextBorderColor);
				bShowCaret = false;
			}
			y += m_nFontSize + 1;
			nLineAhead = nLineEnd;
		}while(nLineEnd < m_nSkipBehind);
	}
}

void KWndEdit::SetTextPtr(char* pText, int nMaxLen)
{
	m_Flag  = 0;
	m_pText = pText;
	if ((m_nBufferSize = nMaxLen) <= 0)
		m_nBufferSize = 0;
	else if (m_nLimitText > m_nBufferSize - 1)
		m_nLimitText = m_nBufferSize - 1;
}

void KWndEdit::SetText(const char* pText)
{
	if (pText && m_pText)
	{
		m_nTextLen = strlen(pText);
		if (m_nTextLen > m_nLimitText)
			m_nTextLen = TSplitString(pText, m_nLimitText, true);
		memcpy(m_pText, pText, m_nTextLen);
		m_pText[m_nTextLen] = 0;
		m_nCaretPos = m_nTextLen;
		UpdateData();
	}
}

void KWndEdit::ClearText(bool bSafe)
{
	if (m_pText)
	{
		m_nTextLen = 0;
		m_nCaretPos = 0;
		if (bSafe == false)
			m_pText[0] = 0;
		else
			memset(m_pText, 0, m_nBufferSize);
		UpdateData();
	}
}

void KWndEdit::SetIntText(int nNumber)
{
	char	Buff[16];
	sprintf(Buff, "%d", nNumber);
	SetText(Buff);
}

int	KWndEdit::GetIntNumber()
{
	if (m_pText)
		return atoi(m_pText);
	return 0;
}

int KWndEdit::GetText(char* pBuffer, int nSize, bool bExcludeSpace)
{
	int nRet = 0;
	if (m_pText && pBuffer)
	{
		int nSkipAhead = 0;
		nRet = m_nTextLen;
		if (bExcludeSpace)
		{
			while(nRet && m_pText[nRet - 1] == ' ')
				nRet --;
			while(nSkipAhead < nRet && m_pText[nSkipAhead] == ' ')
				nSkipAhead ++;
		}

		if (nRet - nSkipAhead + 1 <= nSize)
		{
			memcpy(pBuffer, &m_pText[nSkipAhead], nRet - nSkipAhead);
			nRet -= nSkipAhead;
			pBuffer[nRet] = 0;
		}
		else
			nRet = -1;
	}
	return nRet;
}

void KWndEdit::GetCaretPosition(int* nx, int* ny)
{
	if (nx)
		*nx = Tcvn3VisualCharCount(m_pText, m_nSkipAhead, m_nCaretPos) * m_nFontSize / 2;
	if (ny)
		*ny = m_nCaretLineIndex  * m_nFontSize;
}

KWndEdit32::KWndEdit32()
{
	m_Text[0] = m_Text[31] = 0;
	SetTextPtr(m_Text, 32);
}

KWndEdit512::KWndEdit512()
{
	m_Text[0] = m_Text[511] = 0;
	SetTextPtr(m_Text, 512);
}
