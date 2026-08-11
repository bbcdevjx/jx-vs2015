#pragma once
#include "WndWindow.h"
#include "WndText.h"

#define	WNDEDIT_ES_FILTER				0x00ff
#define	WNDEDIT_ES_ENGLISH_AVAILABLE	0x0001	
#define	WNDEDIT_ES_IME_AVAILABLE		0x0002		
#define	WNDEDIT_ES_CHAR_TYPE_FILTER		(WNDEDIT_ES_ENGLISH_AVAILABLE | WNDEDIT_ES_IME_AVAILABLE)
#define	WNDEDIT_ES_MASK_CHARACTER		0x0010		
#define	WNDEDIT_ES_MULTI_LINE			0x0020	
#define	WNDEDIT_F_HAVE_FOCUS			0x0100		

class KWndEdit : public KWndWindow
{
public:
	KWndEdit();
	~KWndEdit();
	virtual int	Init(KIniFile* pIniFile, const char* pSection);
	virtual int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);
	virtual void	PaintWindow();		
	void			SetColor(unsigned int uColor);
	void			SetText(const char* pText);		
	int				GetText(char* pBuffer, int nSize, bool bExcludeSpace);
	void			SetIntText(int nNumber);			
	int				GetIntNumber();
	void			Enable(int bEnable);		
	void			Clone(KWndEdit* pCopy);
	void			ClearText(bool bSafe = false);
	int				InsertString(const char* pString, int nLen);
	void			GetCaretPosition(int* nx, int* ny);
	unsigned int	GetFocusBkColor()	{return m_FocusBkColor;}
	void	SetFocusBkColor(unsigned int nC)	{m_FocusBkColor = nC;}

protected:
	void			SetTextPtr(char* pText, int nMaxLen);	
	int				InsertChar(int nChar);					
	int				InsertChar(char cLow, char cHigh);		
	int				InsertUnicodeChar(wchar_t nChar);
	int				InsertUnicodeString(const wchar_t* pString, int nLen);
	int				OnKeyDown(int nKeyCode, int nModifiers);

private:
	int				CharFromPos(int x, int y);		
	void			UpdateData();
	void			FmtForShow();
	int				Paste();
private:
	unsigned int	m_Flag;
	int			m_nFontSize;			
	char*		m_pText;			
	int			m_nBufferSize;		
	int			m_nLimitText;			
	int			m_nTextLen;				

	int			m_nSkipAhead;			
	int			m_nSkipBehind;			
	int			m_nCaretLineIndex;		
	int			m_nCaretPos;				
	int			m_nCaretTime;		

  int     m_nCaretX;
  int     m_nCaretY;

	unsigned int m_TextColor;			
	unsigned int m_TextBorderColor;	
	unsigned int m_FocusBkColor;			
};

class KWndEdit32 : public KWndEdit
{
private:
	char			m_Text[32];
public:
	KWndEdit32();
};

class KWndEdit512 : public KWndEdit
{
private:
	char			m_Text[512];
public:
	KWndEdit512();
};
