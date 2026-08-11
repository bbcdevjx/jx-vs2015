//---------------------------------------------------------------------------
// Sword3 Engine (c) 1999-2000 by Kingsoft
//
// File:	KDrawSpriteAlpha.cpp
// Date:	2000.08.08
// Code:	WangWei(Daphnis), Wooy(Wu yue)
// Desc:	Sprite Alpha Drawing Function
//---------------------------------------------------------------------------
#include "KWin32.h"
#include "KCanvas.h"
#include "KDrawSpriteAlpha.h"
#include "DrawSpriteMP.inc"

inline void g_ColorOverlay(UINT& dR, UINT& dG, UINT& dB, int nColor)
{
	float sR = (float)(dR << 3)/255.f;
	float sG = (float)(dG << 2)/255.f;
	float sB = (float)(dB << 3)/255.f;
	float cR = (float)((nColor & 0xff0000) >> 16)/255.f;
	float cG = (float)((nColor & 0xff00) >> 8)/255.f;
	float cB = (float)((nColor & 0xff))/255.f;
	float d = (sR*0.3f + sG*0.59f + sB*0.11f) - (cR*0.3f + cG*0.59f + cB*0.11f);
	cR += d;
	cG += d;
	cB += d;
	float fL = (cR*0.3f + cG*0.59f + cB*0.11f);
	float fMin = cR;
	if(fMin > cG)
		fMin = cG;
	if(fMin > cB)
		fMin = cB;
	float fMax = cR;
	if(fMax < cG)
		fMax = cG;
	if(fMax < cB)
		fMax = cB;
	if(fMin < 0.f)
	{
		cR = fL + ((cR-fL)*fL)/(fL-fMin);
		cG = fL + ((cG-fL)*fL)/(fL-fMin);
		cB = fL + ((cB-fL)*fL)/(fL-fMin);
	}
	if(fMax > 1.f)
	{
		cR = fL + ((cR-fL)*(1.f-fL))/(fMax-fL);
		cG = fL + ((cG-fL)*(1.f-fL))/(fMax-fL);
		cB = fL + ((cB-fL)*(1.f-fL))/(fMax-fL);
	}
	dR = ((UINT)(cR*255.f)) >> 3;
	dG = ((UINT)(cG*255.f)) >> 2;
	dB = ((UINT)(cB*255.f)) >> 3;
}
//---------------------------------------------------------------------------
// º¯Êý:	Draw Sprite nAlpha
// ¹¦ÄÜ:	»æÖÆ256É«SpriteÎ»Í¼(²»´øÔ¤äÖÈ¾)
// ²ÎÊý:	KDrawNode*, KCanvas* 
// ·µ»Ø:	void
//---------------------------------------------------------------------------
void g_DrawSpriteAlpha(void* node, void* canvas)
{
	KDrawNode* pNode = (KDrawNode *)node;
	KCanvas* pCanvas = (KCanvas *)canvas;
	
	// t¹o clip vu«ng trªn bÒ mÆt canvas dùa trªn chiÒu réng x cao cña ¶nh
	KClipper Clipper;
	if (pCanvas->MakeClip(pNode->m_nX, pNode->m_nY, pNode->m_nWidth, pNode->m_nHeight, &Clipper) == 0)
		return;

	// ®iÓm b¾t ®Çu (0,0) cña canvas 
	int nPitch;
	BYTE* pBuffer = (BYTE*)pCanvas->LockCanvas(nPitch);
	if (pBuffer == NULL)
		return;
	int nPixelSize = 2;	//kÝch th­íc 1 ®iÓm mµu trªn canvas (víi 16bit lµ 2 bytes, víi 32bit lµ 4 bytes)
	pBuffer += Clipper.y * nPitch + Clipper.x * nPixelSize;
	BYTE* pPalette	= (BYTE*)pNode->m_pPalette;// palette pointer
	BYTE* pSprite = (BYTE*)pNode->m_pBitmap;	// sprite pointer
	int nBuffNextLine = nPitch - Clipper.width * nPixelSize;// next line add
	int nSprSkip = pNode->m_nWidth * Clipper.top + Clipper.left; //bá qua phÇn bÞ lÊn phÝa trªn cña ¶nh
	int nSprSkipPerLine = Clipper.left + Clipper.right;//left:sè ®iÓm mÊt tõ tr¸i qua, right: sè ®iÓm mÊt tõ lÒ ph¶i qua tr¸i
	int nMask32 = pCanvas->m_nMask32;	// rgb mask32
	UINT tmpAlpha, alpha, nSrcColor, nDstColor;
	int nPixelBatch, nWidth;
	if(!nSprSkip)
	goto	_SkipSpriteAheadContentEnd_;

	_SkipSpriteAheadContentLocalStart_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_SkipSpriteAheadContentLocalAlpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_SkipSpriteAheadContentLocalStart_;
		nSprSkip = -nSprSkip;
		goto	_SkipSpriteAheadContentEnd_;
	_SkipSpriteAheadContentLocalAlpha_:
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
		{
			pSprite += nPixelBatch;
			goto	_SkipSpriteAheadContentLocalStart_;
		}
		nSprSkip = -nSprSkip;
		pSprite += nPixelBatch - nSprSkip;
	_SkipSpriteAheadContentEnd_:
		if (nSprSkipPerLine)
			goto	_DrawPartLineSection_;
	
	_DrawFullLineSection_Line_:
		nWidth = Clipper.width;
	_DrawFullLineSection_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_DrawFullLineSection_LineLocal_Alpha_;
		pBuffer += nPixelBatch*nPixelSize; //phÇn nµy kh«ng vÏ, chØ nh¶y qua
		nWidth -= nPixelBatch;
		if(nWidth > 0)
			goto	_DrawFullLineSection_LineLocal_;
		pBuffer += nBuffNextLine;
		Clipper.height--;
		if(Clipper.height)
			goto	_DrawFullLineSection_Line_;
		goto	_EXIT_WAY_;
	_DrawFullLineSection_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		alpha >>= 3;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		if(nWidth)
			goto	_DrawFullLineSection_LineLocal_;
		pBuffer += nBuffNextLine;
		Clipper.height--;
		if(Clipper.height)
			goto	_DrawFullLineSection_Line_;
		goto	_EXIT_WAY_;
	//b¾t ®Çu vÏ mét phÇn cña sprite
	_DrawPartLineSection_:
		if(!Clipper.left)
			goto	_DrawPartLineSection_SkipRight_Line_;
		if(!Clipper.right)
			goto	_DrawPartLineSection_SkipLeft_Line_;
	//phÇn sprite mÊt lÒ tr¸i vµ ph¶i
	_DrawPartLineSection_Line_:
		nWidth = Clipper.width;
		if(nSprSkip)
		{
			nPixelBatch = nSprSkip;
			goto	_DrawPartLineSection_LineLocal_CheckAlpha_;
		}
	_DrawPartLineSection_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_LineLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_LineLocal_Alpha_;
		nWidth -= nPixelBatch;
		if(nWidth > 0)
		{
			pBuffer += nPixelBatch*nPixelSize;
			goto	_DrawPartLineSection_LineLocal_;
		}
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
		pBuffer += (nPixelBatch + nWidth)*nPixelSize;
		nWidth = -nWidth;//sè d­ nPixelBatch cßn l¹i v­ît qua nWidth, xuèng hµng
	
	_DrawPartLineSection_LineSkip_:
		pBuffer += nBuffNextLine;
		nSprSkip = nSprSkipPerLine;
		if(nWidth)
		{
			nPixelBatch = nWidth;
			goto	_DrawPartLineSection_LineSkipLocal_CheckAlpha_;
		}
	_DrawPartLineSection_LineSkipLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_LineSkipLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_LineSkipLocal_Alpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_LineSkipLocal_;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_Line_;
	_DrawPartLineSection_LineSkipLocal_Alpha_:
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
		{
			pSprite += nPixelBatch;
			goto	_DrawPartLineSection_LineSkipLocal_;
		}
		pSprite += nPixelBatch + nSprSkip;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_Line_;
	_DrawPartLineSection_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		if(nWidth <= 0)
		{
			nWidth = -nWidth;
			nPixelBatch -= nWidth;
			goto	_DrawPartLineSection_LineLocal_Alpha_Part_;
		}
		alpha >>= 3;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		goto	_DrawPartLineSection_LineLocal_;
	_DrawPartLineSection_LineLocal_Alpha_Part_:
		tmpAlpha = alpha;
		alpha >>= 3;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
		alpha = tmpAlpha;
		goto	_DrawPartLineSection_LineSkip_;
	//phÇn sprite bÞ mÊt bªn tr¸i
	_DrawPartLineSection_SkipLeft_Line_:
		nWidth = Clipper.width;
		if(nSprSkip)
		{
			nPixelBatch = nSprSkip;
			goto	_DrawPartLineSection_SkipLeft_LineLocal_CheckAlpha_;
		}
	_DrawPartLineSection_SkipLeft_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_SkipLeft_LineLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_SkipLeft_LineLocal_Alpha_;
		pBuffer += nPixelBatch*nPixelSize; //phÇn nµy kh«ng vÏ, chØ nh¶y qua
		nWidth -= nPixelBatch;
		if(nWidth > 0)
			goto	_DrawPartLineSection_SkipLeft_LineLocal_;
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
	_DrawPartLineSection_SkipLeft_LineSkip_:
		pBuffer += nBuffNextLine;
		nSprSkip = nSprSkipPerLine;
	_DrawPartLineSection_SkipLeft_LineSkipLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_DrawPartLineSection_SkipLeft_LineSkipLocal_Alpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_SkipLeft_LineSkipLocal_;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_SkipLeft_Line_;
	_DrawPartLineSection_SkipLeft_LineSkipLocal_Alpha_:
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
		{
			pSprite += nPixelBatch;
			goto	_DrawPartLineSection_SkipLeft_LineSkipLocal_;
		}
		pSprite += nPixelBatch + nSprSkip;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_SkipLeft_Line_;
	_DrawPartLineSection_SkipLeft_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		alpha >>= 3;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		if(nWidth)
			goto	_DrawPartLineSection_SkipLeft_LineLocal_;
		Clipper.height--;
		if(Clipper.height > 0)
			goto	_DrawPartLineSection_SkipLeft_LineSkip_;
		goto	_EXIT_WAY_;
	//phÇn sprite bÞ mÊt bªn ph¶i
	_DrawPartLineSection_SkipRight_Line_:
		nWidth = Clipper.width;
	_DrawPartLineSection_SkipRight_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_DrawPartLineSection_SkipRight_LineLocal_Alpha_;
		nWidth -= nPixelBatch;
		if(nWidth > 0)
		{
			pBuffer += nPixelBatch*nPixelSize; //phÇn nµy kh«ng vÏ, chØ nh¶y qua
			goto	_DrawPartLineSection_SkipRight_LineLocal_;
		}
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
		pBuffer += (nPixelBatch + nWidth)*nPixelSize;
		nWidth = -nWidth;
	_DrawPartLineSection_SkipRight_LineSkip_:
		pBuffer += nBuffNextLine;
		nSprSkip = nSprSkipPerLine;
		if(nWidth)
		{
			nPixelBatch = nWidth;
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_CheckAlpha_;
		}
	_DrawPartLineSection_SkipRight_LineSkipLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_SkipRight_LineSkipLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_Alpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_;
		goto	_DrawPartLineSection_SkipRight_Line_;
	_DrawPartLineSection_SkipRight_LineSkipLocal_Alpha_:
		pSprite += nPixelBatch;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_;
		goto	_DrawPartLineSection_SkipRight_Line_;
	_DrawPartLineSection_SkipRight_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		if(nWidth <= 0)
		{
			nPixelBatch += nWidth;
			goto	_DrawPartLineSection_SkipRight_LineLocal_Alpha_Part_;
		}
		alpha >>= 3;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		goto	_DrawPartLineSection_SkipRight_LineLocal_;
	_DrawPartLineSection_SkipRight_LineLocal_Alpha_Part_:
		tmpAlpha = alpha;
		alpha >>= 3;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		alpha = tmpAlpha;
		nWidth = -nWidth;
		Clipper.height--;
		if(Clipper.height > 0)
			goto	_DrawPartLineSection_SkipRight_LineSkip_;
		goto	_EXIT_WAY_;
	
	_EXIT_WAY_:
	pCanvas->UnlockCanvas();
}




void g_DrawSpriteAlpha(void* node, void* canvas, int nExAlpha)
{
	if (nExAlpha <= 0)
		return;

	if (nExAlpha >= 31)
	{
		g_DrawSpriteAlpha(node, canvas);
		return;
	}
	KDrawNode* pNode = (KDrawNode *)node;
	KCanvas* pCanvas = (KCanvas *)canvas;
	
	// t¹o clip vu«ng trªn bÒ mÆt canvas dùa trªn chiÒu réng x cao cña ¶nh
	KClipper Clipper;
	if (pCanvas->MakeClip(pNode->m_nX, pNode->m_nY, pNode->m_nWidth, pNode->m_nHeight, &Clipper) == 0)
		return;

	// ®iÓm b¾t ®Çu (0,0) cña canvas 
	int nPitch;
	BYTE* pBuffer = (BYTE*)pCanvas->LockCanvas(nPitch);
	if (pBuffer == NULL)
		return;
	int nPixelSize = 2;	//kÝch th­íc 1 ®iÓm mµu trªn canvas (víi 16bit lµ 2 bytes, víi 32bit lµ 4 bytes)
	pBuffer += Clipper.y * nPitch + Clipper.x * nPixelSize;
	BYTE* pPalette	= (BYTE*)pNode->m_pPalette;// palette pointer
	BYTE* pSprite = (BYTE*)pNode->m_pBitmap;	// sprite pointer
	int nBuffNextLine = nPitch - Clipper.width * nPixelSize;// next line add
	int nSprSkip = pNode->m_nWidth * Clipper.top + Clipper.left; //bá qua phÇn bÞ lÊn phÝa trªn cña ¶nh
	int nSprSkipPerLine = Clipper.left + Clipper.right;//left:sè ®iÓm mÊt tõ tr¸i qua, right: sè ®iÓm mÊt tõ lÒ ph¶i qua tr¸i
	int nMask32 = pCanvas->m_nMask32;	// rgb mask32
	UINT tmpAlpha, alpha, nSrcColor, nDstColor;
	int nPixelBatch, nWidth;
	if(!nSprSkip)
	goto	_SkipSpriteAheadContentEnd_;

	_SkipSpriteAheadContentLocalStart_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_SkipSpriteAheadContentLocalAlpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_SkipSpriteAheadContentLocalStart_;
		nSprSkip = -nSprSkip;
		goto	_SkipSpriteAheadContentEnd_;
	_SkipSpriteAheadContentLocalAlpha_:
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
		{
			pSprite += nPixelBatch;
			goto	_SkipSpriteAheadContentLocalStart_;
		}
		nSprSkip = -nSprSkip;
		pSprite += nPixelBatch - nSprSkip;
	_SkipSpriteAheadContentEnd_:
		if (nSprSkipPerLine)
			goto	_DrawPartLineSection_;
	
	_DrawFullLineSection_Line_:
		nWidth = Clipper.width;
	_DrawFullLineSection_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_DrawFullLineSection_LineLocal_Alpha_;
		pBuffer += nPixelBatch*nPixelSize; //phÇn nµy kh«ng vÏ, chØ nh¶y qua
		nWidth -= nPixelBatch;
		if(nWidth > 0)
			goto	_DrawFullLineSection_LineLocal_;
		pBuffer += nBuffNextLine;
		Clipper.height--;
		if(Clipper.height)
			goto	_DrawFullLineSection_Line_;
		goto	_EXIT_WAY_;
	_DrawFullLineSection_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		if(nWidth)
			goto	_DrawFullLineSection_LineLocal_;
		pBuffer += nBuffNextLine;
		Clipper.height--;
		if(Clipper.height)
			goto	_DrawFullLineSection_Line_;
		goto	_EXIT_WAY_;
	//b¾t ®Çu vÏ mét phÇn cña sprite
	_DrawPartLineSection_:
		if(!Clipper.left)
			goto	_DrawPartLineSection_SkipRight_Line_;
		if(!Clipper.right)
			goto	_DrawPartLineSection_SkipLeft_Line_;
	//phÇn sprite mÊt lÒ tr¸i vµ ph¶i
	_DrawPartLineSection_Line_:
		nWidth = Clipper.width;
		if(nSprSkip)
		{
			nPixelBatch = nSprSkip;
			goto	_DrawPartLineSection_LineLocal_CheckAlpha_;
		}
	_DrawPartLineSection_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_LineLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_LineLocal_Alpha_;
		nWidth -= nPixelBatch;
		if(nWidth > 0)
		{
			pBuffer += nPixelBatch*nPixelSize;
			goto	_DrawPartLineSection_LineLocal_;
		}
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
		pBuffer += (nPixelBatch + nWidth)*nPixelSize;
		nWidth = -nWidth;//sè d­ nPixelBatch cßn l¹i v­ît qua nWidth, xuèng hµng
	
	_DrawPartLineSection_LineSkip_:
		pBuffer += nBuffNextLine;
		nSprSkip = nSprSkipPerLine;
		if(nWidth)
		{
			nPixelBatch = nWidth;
			goto	_DrawPartLineSection_LineSkipLocal_CheckAlpha_;
		}
	_DrawPartLineSection_LineSkipLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_LineSkipLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_LineSkipLocal_Alpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_LineSkipLocal_;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_Line_;
	_DrawPartLineSection_LineSkipLocal_Alpha_:
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
		{
			pSprite += nPixelBatch;
			goto	_DrawPartLineSection_LineSkipLocal_;
		}
		pSprite += nPixelBatch + nSprSkip;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_Line_;
	_DrawPartLineSection_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		if(nWidth <= 0)
		{
			nWidth = -nWidth;
			nPixelBatch -= nWidth;
			goto	_DrawPartLineSection_LineLocal_Alpha_Part_;
		}
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		goto	_DrawPartLineSection_LineLocal_;
	_DrawPartLineSection_LineLocal_Alpha_Part_:
		tmpAlpha = alpha;
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
		alpha = tmpAlpha;
		goto	_DrawPartLineSection_LineSkip_;
	//phÇn sprite bÞ mÊt bªn tr¸i
	_DrawPartLineSection_SkipLeft_Line_:
		nWidth = Clipper.width;
		if(nSprSkip)
		{
			nPixelBatch = nSprSkip;
			goto	_DrawPartLineSection_SkipLeft_LineLocal_CheckAlpha_;
		}
	_DrawPartLineSection_SkipLeft_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_SkipLeft_LineLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_SkipLeft_LineLocal_Alpha_;
		pBuffer += nPixelBatch*nPixelSize; //phÇn nµy kh«ng vÏ, chØ nh¶y qua
		nWidth -= nPixelBatch;
		if(nWidth > 0)
			goto	_DrawPartLineSection_SkipLeft_LineLocal_;
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
	_DrawPartLineSection_SkipLeft_LineSkip_:
		pBuffer += nBuffNextLine;
		nSprSkip = nSprSkipPerLine;
	_DrawPartLineSection_SkipLeft_LineSkipLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_DrawPartLineSection_SkipLeft_LineSkipLocal_Alpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_SkipLeft_LineSkipLocal_;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_SkipLeft_Line_;
	_DrawPartLineSection_SkipLeft_LineSkipLocal_Alpha_:
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
		{
			pSprite += nPixelBatch;
			goto	_DrawPartLineSection_SkipLeft_LineSkipLocal_;
		}
		pSprite += nPixelBatch + nSprSkip;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_SkipLeft_Line_;
	_DrawPartLineSection_SkipLeft_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		if(nWidth)
			goto	_DrawPartLineSection_SkipLeft_LineLocal_;
		Clipper.height--;
		if(Clipper.height > 0)
			goto	_DrawPartLineSection_SkipLeft_LineSkip_;
		goto	_EXIT_WAY_;
	//phÇn sprite bÞ mÊt bªn ph¶i
	_DrawPartLineSection_SkipRight_Line_:
		nWidth = Clipper.width;
	_DrawPartLineSection_SkipRight_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_DrawPartLineSection_SkipRight_LineLocal_Alpha_;
		nWidth -= nPixelBatch;
		if(nWidth > 0)
		{
			pBuffer += nPixelBatch*nPixelSize; //phÇn nµy kh«ng vÏ, chØ nh¶y qua
			goto	_DrawPartLineSection_SkipRight_LineLocal_;
		}
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
		pBuffer += (nPixelBatch + nWidth)*nPixelSize;
		nWidth = -nWidth;
	_DrawPartLineSection_SkipRight_LineSkip_:
		pBuffer += nBuffNextLine;
		nSprSkip = nSprSkipPerLine;
		if(nWidth)
		{
			nPixelBatch = nWidth;
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_CheckAlpha_;
		}
	_DrawPartLineSection_SkipRight_LineSkipLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_SkipRight_LineSkipLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_Alpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_;
		goto	_DrawPartLineSection_SkipRight_Line_;
	_DrawPartLineSection_SkipRight_LineSkipLocal_Alpha_:
		pSprite += nPixelBatch;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_;
		goto	_DrawPartLineSection_SkipRight_Line_;
	_DrawPartLineSection_SkipRight_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		if(nWidth <= 0)
		{
			nPixelBatch += nWidth;
			goto	_DrawPartLineSection_SkipRight_LineLocal_Alpha_Part_;
		}
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		goto	_DrawPartLineSection_SkipRight_LineLocal_;
	_DrawPartLineSection_SkipRight_LineLocal_Alpha_Part_:
		tmpAlpha = alpha;
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			if(alpha >= 31)
			{
				while(nPixelBatch)
				{
					*((WORD*)pBuffer) = *((WORD*)(pPalette + 2*(*(pSprite++))));
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
			else
			{
				while(nPixelBatch)
				{
					nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
					nSrcColor |= (nSrcColor << 16);
					nSrcColor &= nMask32;
					nDstColor = *((WORD*)pBuffer);
					nDstColor |= (nDstColor << 16);
					nDstColor &= nMask32;
					nDstColor = (nSrcColor - nDstColor)*alpha/32 + nDstColor;
					nDstColor &= nMask32;
					nSrcColor = (nDstColor >> 16) & 0x7e0;
					nDstColor = (nDstColor | nSrcColor) & 0xffff;
					*((WORD*)pBuffer) = nDstColor;
					pBuffer += nPixelSize;
					--nPixelBatch;
				}
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		alpha = tmpAlpha;
		nWidth = -nWidth;
		Clipper.height--;
		if(Clipper.height > 0)
			goto	_DrawPartLineSection_SkipRight_LineSkip_;
		goto	_EXIT_WAY_;
	
	_EXIT_WAY_:
	pCanvas->UnlockCanvas();
}

void g_DrawSpriteScreen(void* node, void* canvas, int nExAlpha)
{
	KDrawNode* pNode = (KDrawNode *)node;
	KCanvas* pCanvas = (KCanvas *)canvas;
	
	// t¹o clip vu«ng trªn bÒ mÆt canvas dùa trªn chiÒu réng x cao cña ¶nh
	KClipper Clipper;
	if (pCanvas->MakeClip(pNode->m_nX, pNode->m_nY, pNode->m_nWidth, pNode->m_nHeight, &Clipper) == 0)
		return;

	// ®iÓm b¾t ®Çu (0,0) cña canvas 
	int nPitch;
	BYTE* pBuffer = (BYTE*)pCanvas->LockCanvas(nPitch);
	if (pBuffer == NULL)
		return;
	int nPixelSize = 2;	//kÝch th­íc 1 ®iÓm mµu trªn canvas (víi 16bit lµ 2 bytes, víi 32bit lµ 4 bytes)
	pBuffer += Clipper.y * nPitch + Clipper.x * nPixelSize;
	BYTE* pPalette	= (BYTE*)pNode->m_pPalette;// palette pointer
	BYTE* pSprite = (BYTE*)pNode->m_pBitmap;	// sprite pointer
	int nBuffNextLine = nPitch - Clipper.width * nPixelSize;// next line add
	int nSprSkip = pNode->m_nWidth * Clipper.top + Clipper.left; //bá qua phÇn bÞ lÊn phÝa trªn cña ¶nh
	int nSprSkipPerLine = Clipper.left + Clipper.right;//left:sè ®iÓm mÊt tõ tr¸i qua, right: sè ®iÓm mÊt tõ lÒ ph¶i qua tr¸i
	int nMask32 = pCanvas->m_nMask32;	// rgb mask32
	int nColor = pNode->m_nColor;
	UINT tmpAlpha, alpha, nSrcColor, nDstColor, sR,sG,sB,dR,dG,dB;
	int nPixelBatch, nWidth;
	if(!nSprSkip)
	goto	_SkipSpriteAheadContentEnd_;

	_SkipSpriteAheadContentLocalStart_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_SkipSpriteAheadContentLocalAlpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_SkipSpriteAheadContentLocalStart_;
		nSprSkip = -nSprSkip;
		goto	_SkipSpriteAheadContentEnd_;
	_SkipSpriteAheadContentLocalAlpha_:
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
		{
			pSprite += nPixelBatch;
			goto	_SkipSpriteAheadContentLocalStart_;
		}
		nSprSkip = -nSprSkip;
		pSprite += nPixelBatch - nSprSkip;
	_SkipSpriteAheadContentEnd_:
		if (nSprSkipPerLine)
			goto	_DrawPartLineSection_;
	
	_DrawFullLineSection_Line_:
		nWidth = Clipper.width;
	_DrawFullLineSection_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_DrawFullLineSection_LineLocal_Alpha_;
		pBuffer += nPixelBatch*nPixelSize; //phÇn nµy kh«ng vÏ, chØ nh¶y qua
		nWidth -= nPixelBatch;
		if(nWidth > 0)
			goto	_DrawFullLineSection_LineLocal_;
		pBuffer += nBuffNextLine;
		Clipper.height--;
		if(Clipper.height)
			goto	_DrawFullLineSection_Line_;
		goto	_EXIT_WAY_;
	_DrawFullLineSection_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			while(nPixelBatch)
			{
				nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
				nDstColor = *((WORD*)pBuffer);
				sR = (nSrcColor & 0xf800) >> 11;
				sG = (nSrcColor & 0x07e0) >> 5;
				sB = (nSrcColor & 0x001f);
				if(sR > 1 || sG > 2 || sB > 1)
				{
					if(nColor > 0)
						g_ColorOverlay(sR, sG, sB, nColor);
					dR = (nDstColor & 0xf800) >> 11;
					dG = (nDstColor & 0x07e0) >> 5;
					dB = (nDstColor & 0x001f);
					dR = ((sR + dR - (sR * dR) / 31) * alpha + dR * (31 - alpha)) / 31;
					dG = ((sG + dG - (sG * dG) / 63) * alpha + dG * (31 - alpha)) / 31;
					dB = ((sB + dB - (sB * dB) / 31) * alpha + dB * (31 - alpha)) / 31;
					nDstColor = (dR << 11) | (dG << 5) | dB;
					*((WORD*)pBuffer) = nDstColor;
				}
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		if(nWidth)
			goto	_DrawFullLineSection_LineLocal_;
		pBuffer += nBuffNextLine;
		Clipper.height--;
		if(Clipper.height)
			goto	_DrawFullLineSection_Line_;
		goto	_EXIT_WAY_;
	//b¾t ®Çu vÏ mét phÇn cña sprite
	_DrawPartLineSection_:
		if(!Clipper.left)
			goto	_DrawPartLineSection_SkipRight_Line_;
		if(!Clipper.right)
			goto	_DrawPartLineSection_SkipLeft_Line_;
	//phÇn sprite mÊt lÒ tr¸i vµ ph¶i
	_DrawPartLineSection_Line_:
		nWidth = Clipper.width;
		if(nSprSkip)
		{
			nPixelBatch = nSprSkip;
			goto	_DrawPartLineSection_LineLocal_CheckAlpha_;
		}
	_DrawPartLineSection_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_LineLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_LineLocal_Alpha_;
		nWidth -= nPixelBatch;
		if(nWidth > 0)
		{
			pBuffer += nPixelBatch*nPixelSize;
			goto	_DrawPartLineSection_LineLocal_;
		}
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
		pBuffer += (nPixelBatch + nWidth)*nPixelSize;
		nWidth = -nWidth;//sè d­ nPixelBatch cßn l¹i v­ît qua nWidth, xuèng hµng
	
	_DrawPartLineSection_LineSkip_:
		pBuffer += nBuffNextLine;
		nSprSkip = nSprSkipPerLine;
		if(nWidth)
		{
			nPixelBatch = nWidth;
			goto	_DrawPartLineSection_LineSkipLocal_CheckAlpha_;
		}
	_DrawPartLineSection_LineSkipLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_LineSkipLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_LineSkipLocal_Alpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_LineSkipLocal_;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_Line_;
	_DrawPartLineSection_LineSkipLocal_Alpha_:
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
		{
			pSprite += nPixelBatch;
			goto	_DrawPartLineSection_LineSkipLocal_;
		}
		pSprite += nPixelBatch + nSprSkip;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_Line_;
	_DrawPartLineSection_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		if(nWidth <= 0)
		{
			nWidth = -nWidth;
			nPixelBatch -= nWidth;
			goto	_DrawPartLineSection_LineLocal_Alpha_Part_;
		}
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			while(nPixelBatch)
			{
				nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
				nDstColor = *((WORD*)pBuffer);
				sR = (nSrcColor & 0xf800) >> 11;
				sG = (nSrcColor & 0x07e0) >> 5;
				sB = (nSrcColor & 0x001f);
				if(sR > 1 || sG > 2 || sB > 1)
				{	
					if(nColor > 0)
						g_ColorOverlay(sR, sG, sB, nColor);
					dR = (nDstColor & 0xf800) >> 11;
					dG = (nDstColor & 0x07e0) >> 5;
					dB = (nDstColor & 0x001f);
					dR = ((sR + dR - (sR * dR) / 31) * alpha + dR * (31 - alpha)) / 31;
					dG = ((sG + dG - (sG * dG) / 63) * alpha + dG * (31 - alpha)) / 31;
					dB = ((sB + dB - (sB * dB) / 31) * alpha + dB * (31 - alpha)) / 31;
					nDstColor = (dR << 11) | (dG << 5) | dB;
					*((WORD*)pBuffer) = nDstColor;
				}
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		goto	_DrawPartLineSection_LineLocal_;
	_DrawPartLineSection_LineLocal_Alpha_Part_:
		tmpAlpha = alpha;
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			while(nPixelBatch)
			{
				nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
				nDstColor = *((WORD*)pBuffer);
				sR = (nSrcColor & 0xf800) >> 11;
				sG = (nSrcColor & 0x07e0) >> 5;
				sB = (nSrcColor & 0x001f);
				if(sR > 1 || sG > 2 || sB > 1)
				{
					if(nColor > 0)
						g_ColorOverlay(sR, sG, sB, nColor);
					dR = (nDstColor & 0xf800) >> 11;
					dG = (nDstColor & 0x07e0) >> 5;
					dB = (nDstColor & 0x001f);
					dR = ((sR + dR - (sR * dR) / 31) * alpha + dR * (31 - alpha)) / 31;
					dG = ((sG + dG - (sG * dG) / 63) * alpha + dG * (31 - alpha)) / 31;
					dB = ((sB + dB - (sB * dB) / 31) * alpha + dB * (31 - alpha)) / 31;
					nDstColor = (dR << 11) | (dG << 5) | dB;
					*((WORD*)pBuffer) = nDstColor;
				}
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
		alpha = tmpAlpha;
		goto	_DrawPartLineSection_LineSkip_;
	//phÇn sprite bÞ mÊt bªn tr¸i
	_DrawPartLineSection_SkipLeft_Line_:
		nWidth = Clipper.width;
		if(nSprSkip)
		{
			nPixelBatch = nSprSkip;
			goto	_DrawPartLineSection_SkipLeft_LineLocal_CheckAlpha_;
		}
	_DrawPartLineSection_SkipLeft_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_SkipLeft_LineLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_SkipLeft_LineLocal_Alpha_;
		pBuffer += nPixelBatch*nPixelSize; //phÇn nµy kh«ng vÏ, chØ nh¶y qua
		nWidth -= nPixelBatch;
		if(nWidth > 0)
			goto	_DrawPartLineSection_SkipLeft_LineLocal_;
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
	_DrawPartLineSection_SkipLeft_LineSkip_:
		pBuffer += nBuffNextLine;
		nSprSkip = nSprSkipPerLine;
	_DrawPartLineSection_SkipLeft_LineSkipLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_DrawPartLineSection_SkipLeft_LineSkipLocal_Alpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_SkipLeft_LineSkipLocal_;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_SkipLeft_Line_;
	_DrawPartLineSection_SkipLeft_LineSkipLocal_Alpha_:
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
		{
			pSprite += nPixelBatch;
			goto	_DrawPartLineSection_SkipLeft_LineSkipLocal_;
		}
		pSprite += nPixelBatch + nSprSkip;
		nSprSkip = -nSprSkip;
		goto	_DrawPartLineSection_SkipLeft_Line_;
	_DrawPartLineSection_SkipLeft_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			while(nPixelBatch)
			{
				nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
				nDstColor = *((WORD*)pBuffer);
				sR = (nSrcColor & 0xf800) >> 11;
				sG = (nSrcColor & 0x07e0) >> 5;
				sB = (nSrcColor & 0x001f);
				if(sR > 1 || sG > 2 || sB > 1)
				{
					if(nColor > 0)
						g_ColorOverlay(sR, sG, sB, nColor);
					dR = (nDstColor & 0xf800) >> 11;
					dG = (nDstColor & 0x07e0) >> 5;
					dB = (nDstColor & 0x001f);
					dR = ((sR + dR - (sR * dR) / 31) * alpha + dR * (31 - alpha)) / 31;
					dG = ((sG + dG - (sG * dG) / 63) * alpha + dG * (31 - alpha)) / 31;
					dB = ((sB + dB - (sB * dB) / 31) * alpha + dB * (31 - alpha)) / 31;
					nDstColor = (dR << 11) | (dG << 5) | dB;
					*((WORD*)pBuffer) = nDstColor;
				}
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		if(nWidth)
			goto	_DrawPartLineSection_SkipLeft_LineLocal_;
		Clipper.height--;
		if(Clipper.height > 0)
			goto	_DrawPartLineSection_SkipLeft_LineSkip_;
		goto	_EXIT_WAY_;
	//phÇn sprite bÞ mÊt bªn ph¶i
	_DrawPartLineSection_SkipRight_Line_:
		nWidth = Clipper.width;
	_DrawPartLineSection_SkipRight_LineLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
		if(alpha)
			goto	_DrawPartLineSection_SkipRight_LineLocal_Alpha_;
		nWidth -= nPixelBatch;
		if(nWidth > 0)
		{
			pBuffer += nPixelBatch*nPixelSize; //phÇn nµy kh«ng vÏ, chØ nh¶y qua
			goto	_DrawPartLineSection_SkipRight_LineLocal_;
		}
		Clipper.height--;
		if(!Clipper.height)
			goto	_EXIT_WAY_;
		pBuffer += (nPixelBatch + nWidth)*nPixelSize;
		nWidth = -nWidth;
	_DrawPartLineSection_SkipRight_LineSkip_:
		pBuffer += nBuffNextLine;
		nSprSkip = nSprSkipPerLine;
		if(nWidth)
		{
			nPixelBatch = nWidth;
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_CheckAlpha_;
		}
	_DrawPartLineSection_SkipRight_LineSkipLocal_:
		nPixelBatch = *(pSprite++);
		alpha = *(pSprite++);
	_DrawPartLineSection_SkipRight_LineSkipLocal_CheckAlpha_:
		if(alpha)
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_Alpha_;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_;
		goto	_DrawPartLineSection_SkipRight_Line_;
	_DrawPartLineSection_SkipRight_LineSkipLocal_Alpha_:
		pSprite += nPixelBatch;
		nSprSkip -= nPixelBatch;
		if(nSprSkip > 0)
			goto	_DrawPartLineSection_SkipRight_LineSkipLocal_;
		goto	_DrawPartLineSection_SkipRight_Line_;
	_DrawPartLineSection_SkipRight_LineLocal_Alpha_:
		nWidth -= nPixelBatch;
		if(nWidth <= 0)
		{
			nPixelBatch += nWidth;
			goto	_DrawPartLineSection_SkipRight_LineLocal_Alpha_Part_;
		}
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			while(nPixelBatch)
			{
				nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
				nDstColor = *((WORD*)pBuffer);
				sR = (nSrcColor & 0xf800) >> 11;
				sG = (nSrcColor & 0x07e0) >> 5;
				sB = (nSrcColor & 0x001f);
				if(sR > 1 || sG > 2 || sB > 1)
				{
					if(nColor > 0)
						g_ColorOverlay(sR, sG, sB, nColor);
					dR = (nDstColor & 0xf800) >> 11;
					dG = (nDstColor & 0x07e0) >> 5;
					dB = (nDstColor & 0x001f);
					dR = ((sR + dR - (sR * dR) / 31) * alpha + dR * (31 - alpha)) / 31;
					dG = ((sG + dG - (sG * dG) / 63) * alpha + dG * (31 - alpha)) / 31;
					dB = ((sB + dB - (sB * dB) / 31) * alpha + dB * (31 - alpha)) / 31;
					nDstColor = (dR << 11) | (dG << 5) | dB;
					*((WORD*)pBuffer) = nDstColor;
				}
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		goto	_DrawPartLineSection_SkipRight_LineLocal_;
	_DrawPartLineSection_SkipRight_LineLocal_Alpha_Part_:
		tmpAlpha = alpha;
		alpha >>= 3;
		alpha = alpha*nExAlpha/31;
		if(alpha)
		{
			while(nPixelBatch)
			{
				nSrcColor = *((WORD*)(pPalette + 2*(*(pSprite++))));
				nDstColor = *((WORD*)pBuffer);
				sR = (nSrcColor & 0xf800) >> 11;
				sG = (nSrcColor & 0x07e0) >> 5;
				sB = (nSrcColor & 0x001f);
				if(sR > 1 || sG > 2 || sB > 1)
				{
					if(nColor > 0)
						g_ColorOverlay(sR, sG, sB, nColor);
					dR = (nDstColor & 0xf800) >> 11;
					dG = (nDstColor & 0x07e0) >> 5;
					dB = (nDstColor & 0x001f);
					dR = ((sR + dR - (sR * dR) / 31) * alpha + dR * (31 - alpha)) / 31;
					dG = ((sG + dG - (sG * dG) / 63) * alpha + dG * (31 - alpha)) / 31;
					dB = ((sB + dB - (sB * dB) / 31) * alpha + dB * (31 - alpha)) / 31;
					nDstColor = (dR << 11) | (dG << 5) | dB;
					*((WORD*)pBuffer) = nDstColor;
				}
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		else
		{
			while(nPixelBatch)
			{
				pSprite++;
				pBuffer += nPixelSize;
				--nPixelBatch;
			}
		}
		alpha = tmpAlpha;
		nWidth = -nWidth;
		Clipper.height--;
		if(Clipper.height > 0)
			goto	_DrawPartLineSection_SkipRight_LineSkip_;
		goto	_EXIT_WAY_;
	
	_EXIT_WAY_:
	pCanvas->UnlockCanvas();
}


//Èý¼¶alpha»æÖÆ
void g_DrawSprite3LevelAlpha(void* node, void* canvas)
{
	KDrawNode* pNode = (KDrawNode *)node;
	KCanvas* pCanvas = (KCanvas *)canvas;

	void* pSprite = pNode->m_pBitmap;	// sprite pointer
	void* pPalette	= pNode->m_pPalette;// palette pointer

	// ¶Ô»æÖÆÇøÓò½øÐÐ²Ã¼ô
	KClipper Clipper;
	if (!pCanvas->MakeClip(pNode->m_nX, pNode->m_nY, pNode->m_nWidth, pNode->m_nHeight, &Clipper))
		return;

	int nPitch;
	void* pBuffer = pCanvas->LockCanvas(nPitch);
	if (pBuffer == NULL)
		return;

	long nMask32 = pCanvas->m_nMask32;	// rgb mask32

	// pBufferÖ¸ÏòÆÁÄ»ÆðµãµÄÆ«ÒÆÎ»ÖÃ (ÒÔ×Ö½Ú¼Æ)
	pBuffer = (char*)pBuffer + Clipper.y * nPitch + Clipper.x * 2;
	long nBuffNextLine = nPitch - Clipper.width * 2;// next line add
	long nSprSkip = pNode->m_nWidth * Clipper.top + Clipper.left;
	long nSprSkipPerLine = Clipper.left + Clipper.right;

	__asm
	{
        mov     eax, pPalette
        movd    mm0, eax        // mm0: pPalette

        mov     eax, Clipper.width
        movd    mm1, eax        // mm1: Clipper.width

        mov     eax, nMask32
        movd    mm2, eax        // mm2: nMask32

        // mm3: nAlpha
        // mm4: 32 - nAlpha

        // mm7: push ecx, pop ecx
        // mm6: push edx, pop edx
        // mm5: push eax, pop eax

		//Ê¹ediÖ¸Ïòcanvas»æÖÆÆðµã,Ê¹esiÖ¸ÏòÍ¼¿éÊý¾ÝÆðµã,(Ìø¹ýnSprSkip¸öÏñµãµÄÍ¼ÐÎÊý¾Ý)
		mov		edi, pBuffer
		mov		esi, pSprite

		//_SkipSpriteAheadContent_:
		{
			mov		edx, nSprSkip
			or		edx, edx
			jz		_SkipSpriteAheadContentEnd_

			_SkipSpriteAheadContentLocalStart_:
			{
				read_alpha_2_ebx_run_length_2_eax
				or		ebx, ebx
				jnz		_SkipSpriteAheadContentLocalAlpha_
				sub		edx, eax
				jg		_SkipSpriteAheadContentLocalStart_
				neg		edx
				jmp		_SkipSpriteAheadContentEnd_

				_SkipSpriteAheadContentLocalAlpha_:
				{
					add		esi, eax
					sub		edx, eax
					jg		_SkipSpriteAheadContentLocalStart_
					add		esi, edx
					neg		edx
					jmp		_SkipSpriteAheadContentEnd_
				}
			}
		}
		_SkipSpriteAheadContentEnd_:

		mov		eax, nSprSkipPerLine
		or		eax, eax
		jnz		_DrawPartLineSection_	//if (nSprSkipPerLine) goto _DrawPartLineSection_

		//_DrawFullLineSection_:
		{
			//ÒòÎªsprite²»»á¿çÐÐÑ¹Ëõ£¬ÔòÔËÐÐµ½´Ë´¦edx±ØÎª0£¬Èçsprite»á¿çÐÐÑ¹ËõÔò_DrawFullLineSection_Ðè¸Ä			
			_DrawFullLineSection_Line_:
			{
				movd	edx, mm1    // mm1: Clipper.width
				_DrawFullLineSection_LineLocal_:
				{
					read_alpha_2_ebx_run_length_2_eax

					or		ebx, ebx
					jnz		_DrawFullLineSection_LineLocal_Alpha_
					add		edi, eax
					add		edi, eax
					sub		edx, eax
					jg		_DrawFullLineSection_LineLocal_

					add		edi, nBuffNextLine
					dec		Clipper.height
					jnz		_DrawFullLineSection_Line_
					jmp		_EXIT_WAY_
					
					_DrawFullLineSection_LineLocal_Alpha_:
					{
						movd    mm5, eax
						mov		ecx, eax

						cmp		ebx, 200
						jl		_DrawFullLineSection_LineLocal_HalfAlpha_

						//_DrawFullLineSection_LineLocal_DirectCopy_:
						{
							movd    ebx, mm0    // mm0: pPalette
							_DrawFullLineSection_CopyPixel_:
							{
								copy_pixel_use_eax
								loop	_DrawFullLineSection_CopyPixel_
							}

							movd    eax, mm5
							sub		edx, eax
							jg		_DrawFullLineSection_LineLocal_
	
							add		edi, nBuffNextLine
							dec		Clipper.height
							jnz		_DrawFullLineSection_Line_
							jmp		_EXIT_WAY_
						}

						_DrawFullLineSection_LineLocal_HalfAlpha_:
						{
        					movd    mm6, edx
							_DrawFullLineSection_HalfAlphaPixel_:
							{
								mix_2_pixel_color_use_eabdx
								loop	_DrawFullLineSection_HalfAlphaPixel_
							}
        					movd	edx, mm6
							movd    eax, mm5
							sub		edx, eax
							jg		_DrawFullLineSection_LineLocal_

							add		edi, nBuffNextLine
							dec		Clipper.height
							jnz		_DrawFullLineSection_Line_
							jmp		_EXIT_WAY_
						}
					}
				}
			}
		}

		_DrawPartLineSection_:
		{
			_DrawPartLineSection_Line_:
			{
				mov		eax, edx
				movd	edx, mm1    // mm1: Clipper.width
				or		eax, eax
				jnz		_DrawPartLineSection_LineLocal_CheckAlpha_

				_DrawPartLineSection_LineLocal_:
				{
					read_alpha_2_ebx_run_length_2_eax

					_DrawPartLineSection_LineLocal_CheckAlpha_:
					or		ebx, ebx
					jnz		_DrawPartLineSection_LineLocal_Alpha_
					add		edi, eax
					add		edi, eax
					sub		edx, eax
					jg		_DrawPartLineSection_LineLocal_

					dec		Clipper.height
					jz		_EXIT_WAY_

					add		edi, edx
					add		edi, edx
					neg		edx
				}
				
				_DrawPartLineSection_LineSkip_:
				{
					add		edi, nBuffNextLine
					//Ìø¹ýnSprSkipPerLineÏñËØµÄspriteÄÚÈÝ
					mov		eax, edx
					mov		edx, nSprSkipPerLine
					or		eax, eax
					jnz		_DrawPartLineSection_LineSkipLocal_CheckAlpha_

					_DrawPartLineSection_LineSkipLocal_:
					{
						read_alpha_2_ebx_run_length_2_eax
						
						_DrawPartLineSection_LineSkipLocal_CheckAlpha_:
						or		ebx, ebx
						jnz		_DrawPartLineSection_LineSkipLocal_Alpha_
						sub		edx, eax
						jg		_DrawPartLineSection_LineSkipLocal_
						neg		edx
						jmp		_DrawPartLineSection_Line_

						_DrawPartLineSection_LineSkipLocal_Alpha_:
						{
							add		esi, eax
							sub		edx, eax
							jg		_DrawPartLineSection_LineSkipLocal_
							add		esi, edx
							neg		edx
							jmp		_DrawPartLineSection_Line_
						}
					}
				}

				_DrawPartLineSection_LineLocal_Alpha_:
				{
					cmp		eax, edx
					jnl		_DrawPartLineSection_LineLocal_Alpha_Part_		//²»ÄÜÈ«»­Õâeax¸öÏàÍ¬alphaÖµµÄÏñµã£¬ºóÃæÓÐµãÒÑ¾­³¬³öÇøÓò

					movd	mm5, eax
					mov		ecx, eax
					cmp		ebx, 200
					jl		_DrawPartLineSection_LineLocal_HalfAlpha_
						
					//_DrawPartLineSection_LineLocal_DirectCopy_:
					{
						movd    ebx, mm0    // mm0: pPalette
						_DrawPartLineSection_CopyPixel_:
						{
							copy_pixel_use_eax
							loop	_DrawPartLineSection_CopyPixel_
						}						
						movd    eax, mm5
						sub		edx, eax
						jmp		_DrawPartLineSection_LineLocal_
					}
					
					_DrawPartLineSection_LineLocal_HalfAlpha_:
					{
    					movd    mm6, edx
						_DrawPartLineSection_HalfAlphaPixel_:
						{
							mix_2_pixel_color_use_eabdx
							loop	_DrawPartLineSection_HalfAlphaPixel_
						}
       					movd	edx, mm6
						movd    eax, mm5
						sub		edx, eax
						jmp		_DrawPartLineSection_LineLocal_
					}
				}

				_DrawPartLineSection_LineLocal_Alpha_Part_:
				{
					movd    mm5, eax
					mov		ecx, edx
					cmp		ebx, 200
					jl		_DrawPartLineSection_LineLocal_HalfAlpha_Part_
						
					//_DrawPartLineSection_LineLocal_DirectCopy_Part_:
					{
						movd    ebx, mm0    // mm0: pPalette
						_DrawPartLineSection_CopyPixel_Part_:
						{
							copy_pixel_use_eax
							loop	_DrawPartLineSection_CopyPixel_Part_
						}						
						movd    eax, mm5
				
						dec		Clipper.height
						jz		_EXIT_WAY_

						sub		eax, edx
						mov		edx, eax
						mov		ebx, 255	//Èç¹ûÏëÒªÈ·ÇÐµÄÔ­ebx(alpha)Öµ¿ÉÒÔÔÚÇ°Í·push ebx£¬´Ë´¦pop»ñµÃ
						jmp		_DrawPartLineSection_LineSkip_
					}
					
					_DrawPartLineSection_LineLocal_HalfAlpha_Part_:
					{
    					movd    mm6, edx
						_DrawPartLineSection_HalfAlphaPixel_Part_:
						{
							mix_2_pixel_color_use_eabdx
							loop	_DrawPartLineSection_HalfAlphaPixel_Part_
						}
       					movd	edx, mm6
						movd    eax, mm5
						dec		Clipper.height
						jz		_EXIT_WAY_
						sub		eax, edx
						mov		edx, eax
						mov		ebx, 128	//Èç¹ûÏëÒªÈ·ÇÐµÄÔ­ebx(alpha)Öµ¿ÉÒÔÔÚÇ°Í·push ebx£¬´Ë´¦pop»ñµÃ
						jmp		_DrawPartLineSection_LineSkip_
					}
				}
			}
		}
		_EXIT_WAY_:
        emms
	}
	pCanvas->UnlockCanvas();
}

/*void g_DrawSpriteAlpha_OLD(void* node, void* canvas)
{
	KDrawNode* pNode = (KDrawNode *)node;
	KCanvas* pCanvas = (KCanvas *)canvas;
	
	long nX = pNode->m_nX;// x coord
	long nY = pNode->m_nY;// y coord
	long nWidth = pNode->m_nWidth;// width of sprite
	long nHeight = pNode->m_nHeight;// height of sprite
	void* lpSprite = pNode->m_pBitmap;// sprite pointer
	void* lpPalette	= pNode->m_pPalette;// palette pointer
	void* lpBuffer = pCanvas->m_pCanvas;// canvas buffer
	long nPitch = pCanvas->m_nPitch;// canvas pitch
	long nNextLine = nPitch - nWidth * 2;// next line add
	long nAlpha = pNode->m_nAlpha;// alpha value
	long nMask32 = pCanvas->m_nMask32;// rgb mask32

	// ¶Ô»æÖÆÇøÓò½øÐÐ²Ã¼ô
	KClipper Clipper;
	if (!pCanvas->MakeClip(nX, nY, nWidth, nHeight, &Clipper))
		return;
	//µ±Ç°´úÂëÍ¼ÐÎ×óÓÒÍ¬Ê±±»²Ã¼õÊ±ÓÐÎó
	if (Clipper.left && Clipper.right)
		return;
	
	// »æÖÆº¯ÊýµÄ»ã±à´úÂë
	__asm
	{
//---------------------------------------------------------------------------
// ¼ÆËã EDI Ö¸ÏòÆÁÄ»ÆðµãµÄÆ«ÒÆÁ¿ (ÒÔ×Ö½Ú¼Æ)
// edi = lpBuffer + nPitch * Clipper.y + nX * 2;
//---------------------------------------------------------------------------
		mov		eax, nPitch
		mov		ebx, Clipper.y
		mul		ebx
		mov     ebx, nX
		add		ebx, ebx
		add		eax, ebx
		mov		edi, lpBuffer
		add		edi, eax
//---------------------------------------------------------------------------
// ³õÊ¼»¯ ESI Ö¸ÏòÍ¼¿éÊý¾ÝÆðµã 
// (Ìø¹ýClipper.topÐÐÑ¹ËõÍ¼ÐÎÊý¾Ý)
//---------------------------------------------------------------------------
		mov		esi, lpSprite
		mov		ecx, Clipper.top
		or		ecx, ecx
		jz		loc_DrawSpriteAlpha_0011

loc_DrawSpriteAlpha_0008:

		mov		edx, nWidth

loc_DrawSpriteAlpha_0009:

//		movzx	eax, byte ptr[esi]
//		inc		esi
//		movzx	ebx, byte ptr[esi]
//		inc		esi
//		use uv, change to below
		xor		eax, eax
		xor		ebx, ebx
		mov		al,	 byte ptr[esi]
		inc		esi
		mov		bl,  byte ptr[esi]
		inc		esi
//		change	end
		or		ebx, ebx
		jnz		loc_DrawSpriteAlpha_0010
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0009
		dec     ecx
		jnz		loc_DrawSpriteAlpha_0008
		jmp		loc_DrawSpriteAlpha_0011

loc_DrawSpriteAlpha_0010:

		add		esi, eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0009
		dec     ecx
		jnz		loc_DrawSpriteAlpha_0008
//---------------------------------------------------------------------------
// ¸ù¾Ý Clipper.left, Clipper.right ·Ö 4 ÖÖÇé¿ö
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0011:

		mov		eax, Clipper.left
		or		eax, eax
		jnz		loc_DrawSpriteAlpha_0012
		mov		eax, Clipper.right
		or		eax, eax
		jnz		loc_DrawSpriteAlpha_0013
		jmp		loc_DrawSpriteAlpha_0100

loc_DrawSpriteAlpha_0012:

		mov		eax, Clipper.right
		or		eax, eax
		jnz		loc_DrawSpriteAlpha_0014
		jmp		loc_DrawSpriteAlpha_0200

loc_DrawSpriteAlpha_0013:

		jmp		loc_DrawSpriteAlpha_0300

loc_DrawSpriteAlpha_0014:

		jmp		loc_DrawSpriteAlpha_0400
//---------------------------------------------------------------------------
// ×ó±ß½ç²Ã¼ôÁ¿ == 0
// ÓÒ±ß½ç²Ã¼ôÁ¿ == 0
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0100:

		mov		edx, Clipper.width

loc_DrawSpriteAlpha_0101:

		movzx	eax, byte ptr[esi]
		inc		esi
		movzx	ebx, byte ptr[esi]
		inc		esi
		or		ebx, ebx
		jnz		loc_DrawSpriteAlpha_0102
		
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0101
		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0100
		jmp		loc_DrawSpriteAlpha_exit

loc_DrawSpriteAlpha_0102:
		cmp		ebx, 255
		jl		loc_DrawSpriteAlpha_0110
		push	eax
		push	edx
		mov		ecx, eax
		mov     ebx, lpPalette

loc_DrawSpriteAlpha_0103:

		movzx	eax, byte ptr[esi]
		inc		esi
		mov		dx, [ebx + eax * 2]
		mov		[edi], dx
		inc		edi
		inc		edi
		dec		ecx
		jnz		loc_DrawSpriteAlpha_0103

		pop		edx
		pop		eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0101
		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0100
		jmp		loc_DrawSpriteAlpha_exit

loc_DrawSpriteAlpha_0110:

		push	eax
		push	edx
		mov		ecx, eax
		shr     ebx, 3
		mov		nAlpha, ebx

loc_DrawSpriteAlpha_0111:

		push	ecx
		mov     ebx, lpPalette

		movzx	eax, byte ptr[esi]
		inc		esi
		mov     cx, [ebx + eax * 2]    // ecx = ...rgb
		mov		ax, cx                 // eax = ...rgb
		shl		eax, 16                // eax = rgb...
		mov		ax, cx                 // eax = rgbrgb
		and		eax, nMask32           // eax = .g.r.b
		mov		cx, [edi]              // ecx = ...rgb
		mov		bx, cx                 // ebx = ...rgb
		shl		ebx, 16                // ebx = rgb...
		mov		bx, cx                 // ebx = rgbrgb
		and		ebx, nMask32           // ebx = .g.r.b
		mov		ecx, nAlpha            // ecx = alpha
		mul		ecx                    // eax:edx = eax*ecx
		neg		ecx                    // ecx = -alpha
		add		ecx, 32                // ecx = 32 - alpha
		xchg	eax, ebx               // exchange eax,ebx
		mul		ecx                    // eax = eax * (32 - alpha)
		add		eax, ebx               // eax = eax + ebx
		shr		eax, 5                 // c = (c1 * alpha + c2 * (32 - alpha)) / 32
		and     eax, nMask32           // eax = .g.r.b
		mov     cx, ax                 // ecx = ...r.b
		shr     eax, 16                // eax = ....g.
		or      ax, cx                 // eax = ...rgb

		mov		[edi], ax
		inc		edi
		inc		edi
		pop		ecx
		dec		ecx
		jnz		loc_DrawSpriteAlpha_0111

		pop		edx
		pop		eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0101
		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0100
		jmp		loc_DrawSpriteAlpha_exit

//---------------------------------------------------------------------------
// ×ó±ß½ç²Ã¼ôÁ¿ != 0
// ÓÒ±ß½ç²Ã¼ôÁ¿ == 0
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0200:

		mov		edx, Clipper.left

loc_DrawSpriteAlpha_0201:

		movzx	eax, byte ptr[esi]
		inc		esi
		movzx	ebx, byte ptr[esi]
		inc		esi
		or		ebx, ebx
		jnz		loc_DrawSpriteAlpha_0202
//---------------------------------------------------------------------------
// ´¦ÀínAlpha == 0 µÄÏñËØ (×ó±ß½çÍâ)
//---------------------------------------------------------------------------
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0201
		jz		loc_DrawSpriteAlpha_0203
		neg		edx
		mov		eax, edx
		mov		edx, Clipper.width
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0204
		add		edi, nNextLine
		dec		Clipper.height
		jg		loc_DrawSpriteAlpha_0200
		jmp		loc_DrawSpriteAlpha_exit
//---------------------------------------------------------------------------
// ´¦ÀínAlpha != 0 µÄÏñËØ (×ó±ß½çÍâ)
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0202:

		add		esi, eax
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0201
		jz		loc_DrawSpriteAlpha_0203
//---------------------------------------------------------------------------
// °Ñ¶à¼õµÄ¿í¶È²¹»ØÀ´
//---------------------------------------------------------------------------
		neg		edx
		sub		esi, edx
		sub		edi, edx
		sub		edi, edx

		cmp		ebx, 255
		jl		loc_DrawSpriteAlpha_0210

		push	eax
		push	edx
		mov		ecx, edx
		mov     ebx, lpPalette

loc_DrawSpriteAlpha_Loop20:

		movzx	eax, byte ptr[esi]
		inc		esi
		mov     dx, [ebx + eax * 2]
		mov		[edi], dx
		inc		edi
		inc		edi
		dec     ecx
		jg      loc_DrawSpriteAlpha_Loop20

		pop		edx
		pop		eax
		mov		ecx, edx
		mov		edx, Clipper.width
		sub		edx, ecx
		jg		loc_DrawSpriteAlpha_0204
		add		edi, nNextLine
		dec		Clipper.height
		jg		loc_DrawSpriteAlpha_0200
		jmp		loc_DrawSpriteAlpha_exit

loc_DrawSpriteAlpha_0210:

		push	eax
		push	edx
		mov		ecx, edx
		shr     ebx, 3
		mov		nAlpha, ebx

loc_DrawSpriteAlpha_0211:

		push	ecx
		mov     ebx, lpPalette

		movzx	eax, byte ptr[esi]
		inc		esi
		mov     cx, [ebx + eax * 2]    // ecx = ...rgb
		mov		ax, cx                 // eax = ...rgb
		shl		eax, 16                // eax = rgb...
		mov		ax, cx                 // eax = rgbrgb
		and		eax, nMask32           // eax = .g.r.b
		mov		cx, [edi]              // ecx = ...rgb
		mov		bx, cx                 // ebx = ...rgb
		shl		ebx, 16                // ebx = rgb...
		mov		bx, cx                 // ebx = rgbrgb
		and		ebx, nMask32           // ebx = .g.r.b
		mov		ecx, nAlpha            // ecx = alpha
		mul		ecx                    // eax:edx = eax*ecx
		neg		ecx                    // ecx = -alpha
		add		ecx, 32                // ecx = 32 - alpha
		xchg	eax, ebx               // exchange eax,ebx
		mul		ecx                    // eax = eax * (32 - alpha)
		add		eax, ebx               // eax = eax + ebx
		shr		eax, 5                 // c = (c1 * alpha + c2 * (32 - alpha)) / 32
		and     eax, nMask32           // eax = .g.r.b
		mov     cx, ax                 // ecx = ...r.b
		shr     eax, 16                // eax = ....g.
		or      ax, cx                 // eax = ...rgb

		mov		[edi], ax
		inc		edi
		inc		edi
		pop		ecx
		dec		ecx
		jnz		loc_DrawSpriteAlpha_0211

		pop		edx
		pop		eax
		mov		ecx, edx
		mov		edx, Clipper.width
		sub		edx, ecx
		jg		loc_DrawSpriteAlpha_0204
		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0200
		jmp		loc_DrawSpriteAlpha_exit

//---------------------------------------------------------------------------
// ÒÑ´¦ÀíÍê¼ô²ÃÇø ÏÂÃæµÄ´¦ÀíÏà¶Ô¼òµ¥
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0203:

		mov		edx, Clipper.width

loc_DrawSpriteAlpha_0204:

		movzx	eax, byte ptr[esi]
		inc		esi
		movzx	ebx, byte ptr[esi]
		inc		esi
		or		ebx, ebx
		jnz		loc_DrawSpriteAlpha_0206
//---------------------------------------------------------------------------
// ´¦ÀínAlpha == 0µÄÏñËØ (×ó±ß½çÄÚ)
//---------------------------------------------------------------------------
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0204
		add		edi, nNextLine
		dec		Clipper.height
		jg		loc_DrawSpriteAlpha_0200
		jmp		loc_DrawSpriteAlpha_exit
//---------------------------------------------------------------------------
// ´¦ÀínAlpha != 0µÄÏñËØ (×ó±ß½çÄÚ)
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0206:

		cmp		ebx, 255
		jl		loc_DrawSpriteAlpha_0220

		push	eax
		push	edx
		mov		ecx, eax
		mov     ebx, lpPalette

loc_DrawSpriteAlpha_Loop21:

		movzx	eax, byte ptr[esi]
		inc		esi
		mov     dx, [ebx + eax * 2]
		mov		[edi], dx
		inc		edi
		inc		edi
		dec     ecx
		jg		loc_DrawSpriteAlpha_Loop21

		pop		edx
		pop		eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0204
		add		edi, nNextLine
		dec		Clipper.height
		jg		loc_DrawSpriteAlpha_0200
		jmp		loc_DrawSpriteAlpha_exit

loc_DrawSpriteAlpha_0220:

		push	eax
		push	edx
		mov		ecx, eax
		shr     ebx, 3
		mov		nAlpha, ebx

loc_DrawSpriteAlpha_0221:

		push	ecx
		mov     ebx, lpPalette

		movzx	eax, byte ptr[esi]
		inc		esi
		mov     cx, [ebx + eax * 2]    // ecx = ...rgb
		mov		ax, cx                 // eax = ...rgb
		shl		eax, 16                // eax = rgb...
		mov		ax, cx                 // eax = rgbrgb
		and		eax, nMask32           // eax = .g.r.b
		mov		cx, [edi]              // ecx = ...rgb
		mov		bx, cx                 // ebx = ...rgb
		shl		ebx, 16                // ebx = rgb...
		mov		bx, cx                 // ebx = rgbrgb
		and		ebx, nMask32           // ebx = .g.r.b
		mov		ecx, nAlpha            // ecx = alpha
		mul		ecx                    // eax:edx = eax*ecx
		neg		ecx                    // ecx = -alpha
		add		ecx, 32                // ecx = 32 - alpha
		xchg	eax, ebx               // exchange eax,ebx
		mul		ecx                    // eax = eax * (32 - alpha)
		add		eax, ebx               // eax = eax + ebx
		shr		eax, 5                 // c = (c1 * alpha + c2 * (32 - alpha)) / 32
		and     eax, nMask32           // eax = .g.r.b
		mov     cx, ax                 // ecx = ...r.b
		shr     eax, 16                // eax = ....g.
		or      ax, cx                 // eax = ...rgb

		mov		[edi], ax
		inc		edi
		inc		edi
		pop		ecx
		dec		ecx
		jnz		loc_DrawSpriteAlpha_0221

		pop		edx
		pop		eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0204
		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0200
		jmp		loc_DrawSpriteAlpha_exit

//---------------------------------------------------------------------------
// ×ó±ß½ç²Ã¼ôÁ¿ == 0
// ÓÒ±ß½ç²Ã¼ôÁ¿ != 0
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0300:

		mov		edx, Clipper.width

loc_DrawSpriteAlpha_0301:

		movzx	eax, byte ptr[esi]
		inc		esi
		movzx	ebx, byte ptr[esi]
		inc		esi
		or		ebx, ebx
		jnz		loc_DrawSpriteAlpha_0303
//---------------------------------------------------------------------------
// ´¦Àí nAlpha == 0 µÄÏñËØ (ÓÒ±ß½çÄÚ)
//---------------------------------------------------------------------------
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0301
		neg		edx
		jmp		loc_DrawSpriteAlpha_0305
//---------------------------------------------------------------------------
// ´¦Àí nAlpha != 0 µÄÏñËØ (ÓÒ±ß½çÄÚ)
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0303:

		cmp		edx, eax
		jl		loc_DrawSpriteAlpha_0304

		cmp		ebx, 255
		jl		loc_DrawSpriteAlpha_0310
		
		push	eax
		push	edx
		mov		ecx, eax
		mov     ebx, lpPalette

loc_DrawSpriteAlpha_Loop30:

		movzx	eax, byte ptr[esi]
		inc		esi
		mov     dx, [ebx + eax * 2]
		mov		[edi], dx
		inc		edi
		inc		edi
		dec     ecx
		jg      loc_DrawSpriteAlpha_Loop30

		pop		edx
		pop		eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0301
		neg		edx
		jmp		loc_DrawSpriteAlpha_0305

loc_DrawSpriteAlpha_0310:

		push	eax
		push	edx
		mov		ecx, eax
		shr     ebx, 3
		mov		nAlpha, ebx

loc_DrawSpriteAlpha_0311:

		push	ecx
		mov     ebx, lpPalette

		movzx	eax, byte ptr[esi]
		inc		esi
		mov     cx, [ebx + eax * 2]    // ecx = ...rgb
		mov		ax, cx                 // eax = ...rgb
		shl		eax, 16                // eax = rgb...
		mov		ax, cx                 // eax = rgbrgb
		and		eax, nMask32           // eax = .g.r.b
		mov		cx, [edi]              // ecx = ...rgb
		mov		bx, cx                 // ebx = ...rgb
		shl		ebx, 16                // ebx = rgb...
		mov		bx, cx                 // ebx = rgbrgb
		and		ebx, nMask32           // ebx = .g.r.b
		mov		ecx, nAlpha            // ecx = alpha
		mul		ecx                    // eax:edx = eax*ecx
		neg		ecx                    // ecx = -alpha
		add		ecx, 32                // ecx = 32 - alpha
		xchg	eax, ebx               // exchange eax,ebx
		mul		ecx                    // eax = eax * (32 - alpha)
		add		eax, ebx               // eax = eax + ebx
		shr		eax, 5                 // c = (c1 * alpha + c2 * (32 - alpha)) / 32
		and     eax, nMask32           // eax = .g.r.b
		mov     cx, ax                 // ecx = ...r.b
		shr     eax, 16                // eax = ....g.
		or      ax, cx                 // eax = ...rgb

		mov		[edi], ax
		inc		edi
		inc		edi
		pop		ecx
		dec		ecx
		jnz		loc_DrawSpriteAlpha_0311

		pop		edx
		pop		eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0301
		neg		edx
		jmp		loc_DrawSpriteAlpha_0305

//---------------------------------------------------------------------------
// Á¬ÐøµãµÄ¸öÊý (eax) > ²Ã¼õºóµÄ¿í¶È (edx)
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0304:

		cmp		ebx, 255
		jl		loc_DrawSpriteAlpha_0320

		push	eax
		push	edx
		mov		ecx, edx
		mov     ebx, lpPalette

loc_DrawSpriteAlpha_Loop31:

		movzx	eax, byte ptr[esi]
		inc		esi
		mov     dx, [ebx + eax * 2]
		mov		[edi], dx
		inc		edi
		inc		edi
		dec     ecx
		jg      loc_DrawSpriteAlpha_Loop31

		pop		edx
		pop		eax
		sub		eax, edx
		mov		edx, eax
		add		esi, eax
		add		edi, eax
		add		edi, eax
		jmp		loc_DrawSpriteAlpha_0305

loc_DrawSpriteAlpha_0320:

		push	eax
		push	edx
		mov		ecx, edx
		shr     ebx, 3
		mov		nAlpha, ebx

loc_DrawSpriteAlpha_0321:

		push	ecx
		mov     ebx, lpPalette

		movzx	eax, byte ptr[esi]
		inc		esi
		mov     cx, [ebx + eax * 2]    // ecx = ...rgb
		mov		ax, cx                 // eax = ...rgb
		shl		eax, 16                // eax = rgb...
		mov		ax, cx                 // eax = rgbrgb
		and		eax, nMask32           // eax = .g.r.b
		mov		cx, [edi]              // ecx = ...rgb
		mov		bx, cx                 // ebx = ...rgb
		shl		ebx, 16                // ebx = rgb...
		mov		bx, cx                 // ebx = rgbrgb
		and		ebx, nMask32           // ebx = .g.r.b
		mov		ecx, nAlpha            // ecx = alpha
		mul		ecx                    // eax:edx = eax*ecx
		neg		ecx                    // ecx = -alpha
		add		ecx, 32                // ecx = 32 - alpha
		xchg	eax, ebx               // exchange eax,ebx
		mul		ecx                    // eax = eax * (32 - alpha)
		add		eax, ebx               // eax = eax + ebx
		shr		eax, 5                 // c = (c1 * alpha + c2 * (32 - alpha)) / 32
		and     eax, nMask32           // eax = .g.r.b
		mov     cx, ax                 // ecx = ...r.b
		shr     eax, 16                // eax = ....g.
		or      ax, cx                 // eax = ...rgb

		mov		[edi], ax
		inc		edi
		inc		edi
		pop		ecx
		dec		ecx
		jnz		loc_DrawSpriteAlpha_0321

		pop		edx
		pop		eax
		sub		eax, edx
		mov		edx, eax
		add		esi, eax
		add		edi, eax
		add		edi, eax
		jmp		loc_DrawSpriteAlpha_0305

//---------------------------------------------------------------------------
// ´¦Àí³¬¹ýÁËÓÒ±ß½çµÄ²¿·Ö, edx = ³¬¹ýÓÒ±ß½ç²¿·ÖµÄ³¤¶È
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0305:

		mov		eax, edx
		mov		edx, Clipper.right
		sub		edx, eax
		jle		loc_DrawSpriteAlpha_0308

loc_DrawSpriteAlpha_0306:

		movzx	eax, byte ptr[esi]
		inc		esi
		movzx	ebx, byte ptr[esi]
		inc		esi
		or		ebx, ebx
		jnz		loc_DrawSpriteAlpha_0307
//---------------------------------------------------------------------------
// ´¦Àí nAlpha == 0 µÄÏñËØ (ÓÒ±ß½çÍâ)
//---------------------------------------------------------------------------
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0306
		jmp		loc_DrawSpriteAlpha_0308
//---------------------------------------------------------------------------
// ´¦Àí nAlpha != 0 µÄÏñËØ (ÓÒ±ß½çÍâ)
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0307:

		add		esi, eax
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jg		loc_DrawSpriteAlpha_0306

loc_DrawSpriteAlpha_0308:

		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0300
		jmp		loc_DrawSpriteAlpha_exit

//---------------------------------------------------------------------------
// ×ó±ß½ç²Ã¼ôÁ¿ != 0
// ÓÒ±ß½ç²Ã¼ôÁ¿ != 0
//---------------------------------------------------------------------------
loc_DrawSpriteAlpha_0400:		// Line Begin

		mov		edx, Clipper.left

loc_Draw_GetLength:						// edx ¼ÇÂ¼¸ÃÐÐÑ¹ËõÊý¾Ýµ½²Ã¼ô×ó¶ËµÄ³¤¶È£¬¿ÉÄÜÊÇ¸ºÖµ

		movzx	eax, byte ptr[esi]		// È¡³öÑ¹ËõÊý¾ÝµÄ³¤¶È
		inc		esi
		movzx	ebx, byte ptr[esi]		// È¡³öAlphaÖµ
		inc		esi
		cmp		edx, eax
		jge		loc_Draw_AllLeft		// edx >= eax, ËùÓÐÊý¾Ý¶¼ÔÚ×ó±ß½çÍâ
		mov		ecx, Clipper.width		// ecx µÃµ½Clipper¿í¶È
		add		ecx, edx				// ecx = Clipper¿í¶È + Ñ¹ËõÊý¾Ý×ó¶Ë±»¼ô³¤¶È
		cmp		ecx, 0
		jle		loc_Draw_AllRight		// ecx <= 0£¬ËùÓÐÊý¾Ý¶¼ÔÚÓÒ±ß½çÍâ
		sub		ecx, eax				// ±È½ÏÑ¹ËõÊý¾Ý³¤¶ÈºÍ ecx £¬ecxÐ¡ÓÚ0µÄ»°£¬ecxÖµÎª¸Ã¶ÎÓÒ¶Ë²Ã¼ô³¤¶È
		jge		loc_Draw_GetLength_0	// ecx >= eax ËµÃ÷ÓÒ¶ËÎÞ²Ã¼ô
		cmp		edx, 0
		jl		loc_Draw_RightClip		// ×ó¶ËÓÐ²Ã¼ô£¬ÓÒ¶ËÒ²ÓÐ
		jmp		loc_Draw_AllClip
loc_Draw_GetLength_0:
		cmp		edx, 0
		jl		loc_Draw_NoClip			// ×óÓÒ¶¼Ã»²Ã¼ô
		jmp		loc_Draw_LeftClip
//---------------------------------------------------------------------------
// È«ÔÚ×ó¶ËÍâ
//---------------------------------------------------------------------------
loc_Draw_AllLeft:
		or		ebx, ebx
		jnz		loc_Draw_AllLeft_1
//loc_Draw_AllLeft_0:	// alpha == 0
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jmp		loc_Draw_GetLength
loc_Draw_AllLeft_1: // alpha != 0
		add		edi, eax
		add		edi, eax
		add		esi, eax
		sub		edx, eax
		jmp		loc_Draw_GetLength
//---------------------------------------------------------------------------
// È«ÔÚÓÒ¶ËÍâ
//---------------------------------------------------------------------------
loc_Draw_AllRight:
		or		ebx, ebx
		jnz		loc_Draw_AllRight_1
//loc_Draw_AllRight_0:
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		mov		ebx, edx
		add		ebx, Clipper.width
		add		ebx, Clipper.right
		cmp		ebx, 0
		jl		loc_Draw_GetLength
		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0400	// ÐÐ½áÊø£¬ÏÂÒ»ÐÐ¿ªÊ¼
		jmp		loc_DrawSpriteAlpha_exit		
loc_Draw_AllRight_1:
		add		edi, eax
		add		edi, eax
		add		esi, eax
		sub		edx, eax
		mov		ebx, edx
		add		ebx, Clipper.width
		add		ebx, Clipper.right
		cmp		ebx, 0
		jl		loc_Draw_GetLength
		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0400	// ÐÐ½áÊø£¬ÏÂÒ»ÐÐ¿ªÊ¼
		jmp		loc_DrawSpriteAlpha_exit
//---------------------------------------------------------------------------
// ´¦Àí×óÓÒ¶Ë¶¼²»ÓÃ²Ã¼ôµÄÑ¹Ëõ¶Î
//---------------------------------------------------------------------------
loc_Draw_NoClip:
		or		ebx, ebx
		jnz		loc_Draw_NoClip_1
//loc_Draw_NoClip_0:
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jmp		loc_Draw_GetLength
loc_Draw_NoClip_1:
		cmp		ebx, 255
		jl		loc_Draw_NoClip_Alpha
		push	eax
		push	edx
		mov		ecx, eax
		mov		ebx, lpPalette

loc_Draw_NoClip_Copy:
		movzx	eax, byte ptr[esi]
		inc		esi
		mov		dx, [ebx + eax * 2]
		mov		[edi], dx
		inc		edi
		inc		edi
		dec		ecx
		jnz		loc_Draw_NoClip_Copy
		
		pop		edx
		pop		eax
		sub		edx, eax
		jmp		loc_Draw_GetLength

loc_Draw_NoClip_Alpha:
		push	eax
		push	edx
		mov		ecx, eax
		shr     ebx, 3
		mov		nAlpha, ebx
			
loc_Draw_NoClip_Alpha_LOOP:
		
		push	ecx
		mov     ebx, lpPalette
		
		movzx	eax, byte ptr[esi]
		inc		esi
		mov     cx, [ebx + eax * 2]    // ecx = ...rgb
		mov		ax, cx                 // eax = ...rgb
		shl		eax, 16                // eax = rgb...
		mov		ax, cx                 // eax = rgbrgb
		and		eax, nMask32           // eax = .g.r.b
		mov		cx, [edi]              // ecx = ...rgb
		mov		bx, cx                 // ebx = ...rgb
		shl		ebx, 16                // ebx = rgb...
		mov		bx, cx                 // ebx = rgbrgb
		and		ebx, nMask32           // ebx = .g.r.b
		mov		ecx, nAlpha            // ecx = alpha
		mul		ecx                    // eax:edx = eax*ecx
		neg		ecx                    // ecx = -alpha
		add		ecx, 32                // ecx = 32 - alpha
		xchg	eax, ebx               // exchange eax,ebx
		mul		ecx                    // eax = eax * (32 - alpha)
		add		eax, ebx               // eax = eax + ebx
		shr		eax, 5                 // c = (c1 * alpha + c2 * (32 - alpha)) / 32
		and     eax, nMask32           // eax = .g.r.b
		mov     cx, ax                 // ecx = ...r.b
		shr     eax, 16                // eax = ....g.
		or      ax, cx                 // eax = ...rgb
		
		mov		[edi], ax
		inc		edi
		inc		edi
		pop		ecx
		dec		ecx
		jnz		loc_Draw_NoClip_Alpha_LOOP
		
		pop		edx
		pop		eax
		sub		edx, eax
		jmp		loc_Draw_GetLength
//---------------------------------------------------------------------------
// ´¦Àí×óÓÒ¶ËÍ¬Ê±Òª²Ã¼ôµÄÑ¹Ëõ¶Î
//---------------------------------------------------------------------------
loc_Draw_AllClip:
		or		ebx, ebx				// ÉèÖÃ±êÖ¾Î»
		jnz		loc_Draw_AllClip_1		// AlphaÖµ²»ÎªÁãµÄ´¦Àí
//loc_Draw_AllClip_0:
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		neg		ecx
		cmp		ecx, Clipper.right
		jl		loc_Draw_GetLength		// Spr¸ÃÐÐÃ»Íê£¬½Ó×Å´¦Àí
		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0400// ÐÐ½áÊø£¬ÏÂÒ»ÐÐ¿ªÊ¼
		jmp		loc_DrawSpriteAlpha_exit
loc_Draw_AllClip_1:
		add		edi, eax
		add		edi, eax
		add		esi, eax
		sub		edx, eax				// edx - eax < 0

		add		edi, edx				// ²¹»ØÇ°Ãæ¶à¼õµÄ²¿·Ö
		add		edi, edx				// ediºÍesiÖ¸ÏòÊµ¼ÊÒª
		add		esi, edx				// »æÖÆµÄ²¿·Ö
		
		cmp		ebx, 255
		jl		loc_Draw_AllClip_Alpha
		push	eax
		push	edx
		push	ecx
		mov		ecx, Clipper.width		// Ç°ºó¶¼±»²Ã¼ô£¬ËùÒÔ»æÖÆ³¤¶ÈÎªClipper.width
		mov		ebx, lpPalette
		
loc_Draw_AllClip_Copy:
		movzx	eax, byte ptr[esi]
		inc		esi
		mov     dx, [ebx + eax * 2]
		mov		[edi], dx
		inc		edi
		inc		edi
		dec     ecx
		jnz		loc_Draw_AllClip_Copy
		
		pop		ecx
		pop		edx
		pop		eax
		jmp		loc_Draw_AllClip_End

loc_Draw_AllClip_Alpha:
		push	eax
		push	edx
		push	ecx
		mov		ecx, Clipper.width
		shr     ebx, 3
		mov		nAlpha, ebx
			
loc_Draw_AllClip_Alpha_LOOP:
		
		push	ecx
		mov     ebx, lpPalette
		
		movzx	eax, byte ptr[esi]
		inc		esi
		mov     cx, [ebx + eax * 2]    // ecx = ...rgb
		mov		ax, cx                 // eax = ...rgb
		shl		eax, 16                // eax = rgb...
		mov		ax, cx                 // eax = rgbrgb
		and		eax, nMask32           // eax = .g.r.b
		mov		cx, [edi]              // ecx = ...rgb
		mov		bx, cx                 // ebx = ...rgb
		shl		ebx, 16                // ebx = rgb...
		mov		bx, cx                 // ebx = rgbrgb
		and		ebx, nMask32           // ebx = .g.r.b
		mov		ecx, nAlpha            // ecx = alpha
		mul		ecx                    // eax:edx = eax*ecx
		neg		ecx                    // ecx = -alpha
		add		ecx, 32                // ecx = 32 - alpha
		xchg	eax, ebx               // exchange eax,ebx
		mul		ecx                    // eax = eax * (32 - alpha)
		add		eax, ebx               // eax = eax + ebx
		shr		eax, 5                 // c = (c1 * alpha + c2 * (32 - alpha)) / 32
		and     eax, nMask32           // eax = .g.r.b
		mov     cx, ax                 // ecx = ...r.b
		shr     eax, 16                // eax = ....g.
		or      ax, cx                 // eax = ...rgb
		
		mov		[edi], ax
		inc		edi
		inc		edi
		pop		ecx
		dec		ecx
		jnz		loc_Draw_AllClip_Alpha_LOOP
		
		pop		ecx
		pop		edx
		pop		eax
loc_Draw_AllClip_End:
		neg		ecx
		add		edi, ecx				// °Ñedi¡¢esiÖ¸ÕëÖ¸ÏòÏÂÒ»¶Î
		add		edi, ecx
		add		esi, ecx
		cmp		ecx, Clipper.right
		jl		loc_Draw_GetLength		// Spr¸ÃÐÐÃ»Íê£¬½Ó×Å´¦Àí
		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0400// ÐÐ½áÊø£¬ÏÂÒ»ÐÐ¿ªÊ¼
		jmp		loc_DrawSpriteAlpha_exit
//---------------------------------------------------------------------------
// ´¦ÀíÖ»ÓÐ×ó¶ËÒª²Ã¼ôµÄÑ¹Ëõ¶Î
//---------------------------------------------------------------------------
loc_Draw_LeftClip:
		or		ebx, ebx
		jnz		loc_Draw_LeftClip_1

//loc_Draw_LeftClip_0:
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jmp		loc_Draw_GetLength
loc_Draw_LeftClip_1:
		add		edi, eax
		add		edi, eax
		add		esi, eax
		sub		edx, eax
		add		edi, edx
		add		edi, edx
		add		esi, edx

		cmp		ebx, 255
		jl		loc_Draw_LeftClip_Alpha
		push	eax
		push	edx
		mov		ecx, edx
		neg		ecx
		mov     ebx, lpPalette
		
loc_Draw_LeftClip_Copy:
		
		movzx	eax, byte ptr[esi]
		inc		esi
		mov     dx, [ebx + eax * 2]
		mov		[edi], dx
		inc		edi
		inc		edi
		dec     ecx
		jg      loc_Draw_LeftClip_Copy
		
		pop		edx
		pop		eax
		jmp		loc_Draw_GetLength

loc_Draw_LeftClip_Alpha:
		push	eax
		push	edx
		mov		ecx, edx
		neg		ecx
		shr     ebx, 3
		mov		nAlpha, ebx
		
loc_Draw_LeftClip_Alpha_LOOP:
		
		push	ecx
		mov     ebx, lpPalette
		
		movzx	eax, byte ptr[esi]
		inc		esi
		mov     cx, [ebx + eax * 2]    // ecx = ...rgb
		mov		ax, cx                 // eax = ...rgb
		shl		eax, 16                // eax = rgb...
		mov		ax, cx                 // eax = rgbrgb
		and		eax, nMask32           // eax = .g.r.b
		mov		cx, [edi]              // ecx = ...rgb
		mov		bx, cx                 // ebx = ...rgb
		shl		ebx, 16                // ebx = rgb...
		mov		bx, cx                 // ebx = rgbrgb
		and		ebx, nMask32           // ebx = .g.r.b
		mov		ecx, nAlpha            // ecx = alpha
		mul		ecx                    // eax:edx = eax*ecx
		neg		ecx                    // ecx = -alpha
		add		ecx, 32                // ecx = 32 - alpha
		xchg	eax, ebx               // exchange eax,ebx
		mul		ecx                    // eax = eax * (32 - alpha)
		add		eax, ebx               // eax = eax + ebx
		shr		eax, 5                 // c = (c1 * alpha + c2 * (32 - alpha)) / 32
		and     eax, nMask32           // eax = .g.r.b
		mov     cx, ax                 // ecx = ...r.b
		shr     eax, 16                // eax = ....g.
		or      ax, cx                 // eax = ...rgb
		
		mov		[edi], ax
		inc		edi
		inc		edi
		pop		ecx
		dec		ecx
		jnz		loc_Draw_LeftClip_Alpha_LOOP
		
		pop		edx
		pop		eax
		jmp		loc_Draw_GetLength
//---------------------------------------------------------------------------
// ´¦ÀíÖ»ÓÐÓÒ¶ËÒª²Ã¼ôµÄÑ¹Ëõ¶Î
//---------------------------------------------------------------------------
loc_Draw_RightClip:
		or		ebx, ebx
		jnz		loc_Draw_RightClip_1

//loc_Draw_RightClip_0:
		add		edi, eax
		add		edi, eax
		sub		edx, eax
		neg		ecx
		cmp		ecx, Clipper.right
		jl		loc_Draw_GetLength
		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0400	// ÐÐ½áÊø£¬ÏÂÒ»ÐÐ¿ªÊ¼
		jmp		loc_DrawSpriteAlpha_exit

loc_Draw_RightClip_1:
		sub		edx, eax
		cmp		ebx, 255
		jl		loc_Draw_RightClip_Alpha
		push	eax
		push	edx
		push	ecx
		add		ecx, eax					// µÃµ½Êµ¼Ê»æÖÆµÄ³¤¶È
		mov		ebx, lpPalette
		
loc_Draw_RightClip_Copy:
		movzx	eax, byte ptr[esi]
		inc		esi
		mov		dx, [ebx + eax * 2]
		mov		[edi], dx
		inc		edi
		inc		edi
		dec		ecx
		jnz		loc_Draw_RightClip_Copy
		
		pop		ecx
		pop		edx
		pop		eax
		jmp		loc_Draw_RightClip_End

loc_Draw_RightClip_Alpha:
		add		edi, eax
		add		edi, eax
		add		esi, eax
		jmp		loc_Draw_RightClip_End
		push	eax
		push	edx
		push	ecx
		add		ecx, eax
		shr     ebx, 3
		mov		nAlpha, ebx
			
loc_Draw_RightClip_Alpha_LOOP:
		
		push	ecx
		mov     ebx, lpPalette
		
		movzx	eax, byte ptr[esi]
		inc		esi
		mov     cx, [ebx + eax * 2]    // ecx = ...rgb
		mov		ax, cx                 // eax = ...rgb
		shl		eax, 16                // eax = rgb...
		mov		ax, cx                 // eax = rgbrgb
		and		eax, nMask32           // eax = .g.r.b
		mov		cx, [edi]              // ecx = ...rgb
		mov		bx, cx                 // ebx = ...rgb
		shl		ebx, 16                // ebx = rgb...
		mov		bx, cx                 // ebx = rgbrgb
		and		ebx, nMask32           // ebx = .g.r.b
		mov		ecx, nAlpha            // ecx = alpha
		mul		ecx                    // eax:edx = eax*ecx
		neg		ecx                    // ecx = -alpha
		add		ecx, 32                // ecx = 32 - alpha
		xchg	eax, ebx               // exchange eax,ebx
		mul		ecx                    // eax = eax * (32 - alpha)
		add		eax, ebx               // eax = eax + ebx
		shr		eax, 5                 // c = (c1 * alpha + c2 * (32 - alpha)) / 32
		and     eax, nMask32           // eax = .g.r.b
		mov     cx, ax                 // ecx = ...r.b
		shr     eax, 16                // eax = ....g.
		or      ax, cx                 // eax = ...rgb
		
		mov		[edi], ax
		inc		edi
		inc		edi
		pop		ecx
		dec		ecx
		jnz		loc_Draw_RightClip_Alpha_LOOP

		pop		ecx
		pop		edx
		pop		eax
		
loc_Draw_RightClip_End:
		neg		ecx
		add		edi, ecx				// °Ñedi¡¢esiÖ¸ÕëÖ¸ÏòÏÂÒ»¶Î
		add		edi, ecx
		add		esi, ecx
		cmp		ecx, Clipper.right
		jl		loc_Draw_GetLength		// Spr¸ÃÐÐÃ»Íê£¬½Ó×Å´¦Àí
		add		edi, nNextLine
		dec		Clipper.height
		jnz		loc_DrawSpriteAlpha_0400// ÐÐ½áÊø£¬ÏÂÒ»ÐÐ¿ªÊ¼
		jmp		loc_DrawSpriteAlpha_exit
			
loc_DrawSpriteAlpha_exit:
	}
}*/