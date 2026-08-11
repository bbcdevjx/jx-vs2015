#include "KFont2.h"
#include "string.h"
#include "../KRepresentUnit.h"
#include "../../../Engine/Src/KEngine.h"
#include "../../../Engine/Src/Text.h"
#include "../../../Engine/Src/KColors.h"

namespace
{
	bool IsOneOf5(unsigned char v, unsigned char a, unsigned char b, unsigned char c, unsigned char d, unsigned char e)
	{
		return v == a || v == b || v == c || v == d || v == e;
	}

	bool GetTcvn3UpperPairBase(unsigned char upper, unsigned char accent, unsigned char& lower)
	{
		switch (upper)
		{
		case 'A': lower = 'a'; return IsOneOf5(accent,0xB5,0xB8,0xB6,0xB7,0xB9);
		case 0xA2: lower = 0xA9; return IsOneOf5(accent,0xCA,0xC7,0xC8,0xC9,0xCB);
		case 0xA1: lower = 0xA8; return IsOneOf5(accent,0xBE,0xBB,0xBC,0xBD,0xC6);
		case 'E': lower = 'e'; return IsOneOf5(accent,0xCC,0xD0,0xCE,0xCF,0xD1);
		case 0xA3: lower = 0xAA; return IsOneOf5(accent,0xD5,0xD2,0xD3,0xD4,0xD6);
		case 'I': lower = 'i'; return IsOneOf5(accent,0xD7,0xDD,0xD8,0xDC,0xDE);
		case 'O': lower = 'o'; return IsOneOf5(accent,0xDF,0xE3,0xE1,0xE2,0xE4);
		case 0xA4: lower = 0xAB; return IsOneOf5(accent,0xE8,0xE5,0xE6,0xE7,0xE9);
		case 0xA5: lower = 0xAC; return IsOneOf5(accent,0xED,0xEA,0xEB,0xEC,0xEE);
		case 'U': lower = 'u'; return IsOneOf5(accent,0xEF,0xF3,0xF1,0xF2,0xF4);
		case 0xA6: lower = 0xAD; return IsOneOf5(accent,0xF8,0xF5,0xF6,0xF7,0xF9);
		case 'Y': lower = 'y'; return IsOneOf5(accent,0xFA,0xFD,0xFB,0xFC,0xFE);
		}
		return false;
	}

	void DecodeGlyph(const unsigned char* source, int count, unsigned char* pixels)
	{
		int pos = 0;
		while (pos < count)
		{
			unsigned char data = *source++;
			int run = data & 0x1f;
			if (!run) break;
			while (run-- && pos < count) pixels[pos++] = data >> 5;
		}
		while (pos < count) pixels[pos++] = 0;
	}

	void EncodeGlyph(const unsigned char* pixels, int width, int height, unsigned char* output)
	{
		int out = 0;
		for (int y = 0; y < height; ++y)
			for (int x = 0; x < width; )
			{
				unsigned char alpha = pixels[y * width + x];
				int run = 1;
				while (x + run < width && run < 31 && pixels[y * width + x + run] == alpha) ++run;
				output[out++] = (unsigned char)((alpha << 5) | run);
				x += run;
			}
	}

	bool DrawTcvn3Upper(KFontData& font, KCanvas* canvas, int x, int y, int width, int height,
		unsigned char upperCode, unsigned char accentCode, int color, int borderColor)
	{
		unsigned char lowerCode = 0;
		if (!canvas || !GetTcvn3UpperPairBase(upperCode, accentCode, lowerCode)) return false;
		unsigned char* upperData = font.GetCharacterData(upperCode, 0);
		unsigned char* lowerData = font.GetCharacterData(lowerCode, 0);
		unsigned char* accentData = font.GetCharacterData(accentCode, 0);
		if (!upperData || !lowerData || !accentData) return false;

		const int count = width * height;
		unsigned char* upper = new unsigned char[count];
		unsigned char* lower = new unsigned char[count];
		unsigned char* accent = new unsigned char[count];
		unsigned char* encoded = new unsigned char[count + height];
		DecodeGlyph(upperData, count, upper);
		DecodeGlyph(lowerData, count, lower);
		DecodeGlyph(accentData, count, accent);
		for (int i = 0; i < count; ++i)
			if (accent[i] > lower[i] && accent[i] > upper[i]) upper[i] = accent[i];
		EncodeGlyph(upper, width, height, encoded);
		canvas->DrawFontWithBorder(x, y, width, height, color, 31, encoded, borderColor);
		delete [] encoded; delete [] accent; delete [] lower; delete [] upper;
		return true;
	}
}

KFont2::KFont2()
{
	m_nFontWidth	= 16;
	m_nFontHalfWidth[0] = m_nFontHalfWidth[1] = 8;
	m_nFontHeight	= 16;
	m_nLastPosH		= 0;
	m_nLastPosV		= 0;
	m_pDevice		= 0;
	m_bLoaded		= false;
	m_nRefCount		= 1;
	m_nBorderColor = 0;
	m_nOutputWidth = m_nFontWidth;
	m_nOutputHeight= m_nFontHeight;
}

KFont2::~KFont2()
{
	Terminate();
}

bool KFont2::Init(void* pDrawDevice)
{
	Terminate();
	if ((m_pDevice = pDrawDevice) == 0)
		return false;
	return true;
}

void KFont2::Terminate()
{
	m_pDevice = 0;
	m_bLoaded = false;
	m_Resources.Terminate();
}

bool KFont2::Load(const char* pszFontFile)
{
	m_Resources.Terminate();
	m_bLoaded = false;
	if (m_pDevice)
	{
		//初始化字体字库资源
		if (m_Resources.Load(pszFontFile))
		{
			m_Resources.GetInfo(m_nFontWidth, m_nFontHeight);
			m_bLoaded = true;
			return true;
		}
	}
	return false;
}

void KFont2::OutputText(const char* pszText, int nCount/*= KF_ZERO_END*/,
					int nX/*=KF_FOLLOW*/, int nY/*=KF_FOLLOW*/,
					unsigned int nColor/*=0xff000000*/, int nLineWidth/*=0*/)
{
	if (!pszText || !m_bLoaded)
		return;

	unsigned char*	lpByte = (unsigned char*) pszText;
	int				nL, h;
	int				nPos = 0;
	int				nHalfIndex = 0;

	if (nCount == KRF_ZERO_END)
		nCount = strlen(pszText);
	if (nX == KRF_FOLLOW)
		nX = m_nLastPosH;
	if (nY == KRF_FOLLOW)
		nY = m_nLastPosV;

	h = 0;

	KRColor		c;
	c.Color_dw = nColor;
	int			sColor = g_RGB(c.Color_b.r, c.Color_b.g, c.Color_b.b);

	if (nLineWidth < m_nOutputWidth + m_nOutputWidth)
		nLineWidth = 0; 

	while (nPos < nCount)
	{
		if (nPos + 1 < nCount && DrawTcvn3Upper(m_Resources, (KCanvas*)m_pDevice,
			nX + h, nY, m_nFontWidth, m_nFontHeight, lpByte[nPos], lpByte[nPos + 1],
			sColor, m_nBorderColor))
		{
			nPos += 2;
			h += m_nFontHalfWidth[nHalfIndex];
			nHalfIndex ^= 1;
		}
		else
		{
			nL = lpByte[nPos++];
			DrawCharacter(nX + h, nY, nL, 0, sColor);
			if (nL != 0x0a)
			{
				h += m_nFontHalfWidth[nHalfIndex];
				nHalfIndex ^= 1;
			}
			else
			{
				h = 0;
				nY += m_nOutputHeight;
			}
		}
		if (nLineWidth)
		{
			if (h + m_nOutputWidth > nLineWidth)
			{
				if (nPos < nCount && lpByte[nPos] == 0x0a)	//处理自动换行位置后恰好紧接一个换行符号
					nPos++;
				h = 0;
				nY += m_nOutputHeight;
				nHalfIndex = 0;
			}
		}
	}
	m_nLastPosH = nX + h;
	m_nLastPosV = nY;
}

void KFont2::SetBorderColor(unsigned int uColor)
{
		KRColor		c;
		c.Color_dw = uColor;
		m_nBorderColor = g_RGB(c.Color_b.r, c.Color_b.g, c.Color_b.b);
}


void KFont2::DrawCharacter(int x, int y, unsigned char cFirst, unsigned char cNext, int nColor) const
{
	if (m_pDevice && m_bLoaded)
	{
		unsigned char* pCharacterData = m_Resources.GetCharacterData(cFirst, cNext);		
		if (pCharacterData)
		{
				((KCanvas*)m_pDevice)->DrawFontWithBorder(x, y, m_nFontWidth, m_nFontHeight, nColor, 31, pCharacterData, m_nBorderColor);
		}
	}
}

void KFont2::GetFontSize(int* pWidth, int* pHeight)
{
	if (pWidth)
		*pWidth = m_nFontWidth;
	if (pHeight)
		*pHeight = m_nFontHeight;
}


void KFont2::SetOutputSize(int nOutputWith, int nOutputHeight)
{
	if (nOutputWith > 0)
		m_nOutputWidth = nOutputWith;
	else
		m_nOutputWidth = m_nFontWidth;
	if (nOutputHeight > 0)
		m_nOutputHeight = nOutputHeight;
	else
		m_nOutputHeight = m_nFontHeight;
	m_nFontHalfWidth[0] = m_nOutputWidth / 2;
	m_nFontHalfWidth[1] = (m_nOutputWidth + 1) / 2;
}


iFont* KFont2::Clone()
{
	if (m_nRefCount < 0xffff)
	{
		m_nRefCount ++;
		return ((iFont*)this);
	}
	return NULL;
}

//释放接口对象
void KFont2::Release()
{
	if ((--m_nRefCount) == 0)
		delete (this);
}
