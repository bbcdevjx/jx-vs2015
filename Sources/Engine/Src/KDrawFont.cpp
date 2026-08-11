//---------------------------------------------------------------------------
// Sword3 Engine (c) 1999-2000 by Kingsoft
//
// File:	KDrawFont.cpp
// Date:	2000.08.08
// Code:	Daniel Wang
// Desc:	Alpha Sprite Font Drawing Functions
//---------------------------------------------------------------------------
#include "KWin32.h"
#include "KCanvas.h"
#include "KDrawFont.h"
//---------------------------------------------------------------------------
// Blend one RGB565 pixel using an alpha value in the 0..32 range.
static WORD BlendFontPixel565(WORD nDst, WORD nSrc, int nAlpha)
{
	const int nInvAlpha = 32 - nAlpha;
	const int nRed = ((((nSrc >> 11) & 0x1f) * nAlpha) +
		(((nDst >> 11) & 0x1f) * nInvAlpha)) >> 5;
	const int nGreen = ((((nSrc >> 5) & 0x3f) * nAlpha) +
		(((nDst >> 5) & 0x3f) * nInvAlpha)) >> 5;
	const int nBlue = (((nSrc & 0x1f) * nAlpha) +
		((nDst & 0x1f) * nInvAlpha)) >> 5;
	return (WORD)((nRed << 11) | (nGreen << 5) | nBlue);
}

//---------------------------------------------------------------------------
// 函数:	DrawFont
// 功能:	绘制带8级Alpha的字体
// 参数:	KDrawNode*, KCanvas* 
// 返回:	void
//---------------------------------------------------------------------------
void g_DrawFont(void* node, void* canvas)
{
	KDrawNode* pNode = (KDrawNode *)node;
	KCanvas* pCanvas = (KCanvas *)canvas;
	
	long nX = pNode->m_nX;// x coord
	long nY = pNode->m_nY;// y coord
	long nWidth = pNode->m_nWidth;// width of font
	long nHeight = pNode->m_nHeight;// height of font
	long nColor = pNode->m_nColor;// color of font
	long nAlpha = pNode->m_nAlpha&0x001f;// nAlpha值
	long nTmpAlpha = 0;// nAlpha值2
	void* lpFont = pNode->m_pBitmap;// font pointer

	// 对绘制区域进行裁剪
	KClipper Clipper;
	if (!pCanvas->MakeClip(nX, nY, nWidth, nHeight, &Clipper))
		return;

	int nPitch;
	void* lpBuffer = pCanvas->LockCanvas(nPitch);
	if (lpBuffer == NULL)
		return;

	long nMask32 = pCanvas->m_nMask32;// RGB mask 32bit
	
	// 计算屏幕下一行的偏移
	long nNextLine = nPitch - Clipper.width * 2;
	
	__asm
	{
//---------------------------------------------------------------------------
// 计算 EDI 指向屏幕起点的偏移量 (以字节计)
// edi = nPitch * Clipper.y + nX * 2 + lpBuffer
//---------------------------------------------------------------------------
		mov		eax, nPitch
		mov		ebx, Clipper.y
		mul		ebx
		mov     ebx, Clipper.x
		add		ebx, ebx
		add     eax, ebx
		mov 	edi, lpBuffer
		add		edi, eax
//---------------------------------------------------------------------------
// 初始化 ESI 指向图块数据起点 (跳过 Clipper.top 行图形数据)
//---------------------------------------------------------------------------
		mov		esi, lpFont
		mov		ecx, Clipper.top
		or		ecx, ecx
		jz		loc_DrawFont_0011
		xor		eax, eax

loc_DrawFont_0008:

		mov		edx, nWidth

loc_DrawFont_0009:

		mov     al, [esi]
		inc     esi
		and		al, 0x1f
		sub		edx, eax
		jg		loc_DrawFont_0009
		dec     ecx
		jg  	loc_DrawFont_0008
//---------------------------------------------------------------------------
// jump acorrd Clipper.left, Clipper.right
//---------------------------------------------------------------------------
loc_DrawFont_0011:

		mov		eax, Clipper.left
		or		eax, eax
		jz		loc_DrawFont_0012
		jmp		loc_DrawFont_exit

loc_DrawFont_0012:

		mov		eax, Clipper.right
		or		eax, eax
		jz		loc_DrawFont_0100
		jmp		loc_DrawFont_exit
//---------------------------------------------------------------------------
// Clipper.left  == 0
// Clipper.right == 0
//---------------------------------------------------------------------------
loc_DrawFont_0100:

		mov		edx, Clipper.width

loc_DrawFont_0101:

		xor		eax, eax
		mov     al, [esi]
		inc     esi
		mov		ebx, eax
		shr		ebx, 5
		or		ebx, ebx
		jnz		loc_DrawFont_0102

		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jg		loc_DrawFont_0101
		add		edi, nNextLine
		dec		Clipper.height
		jg		loc_DrawFont_0100
		jmp		loc_DrawFont_exit

loc_DrawFont_0102:

        shl     ebx, 2    //Alpha1 
		
		push    eax
		push    edx 
		mov     eax,nAlpha
		mul     ebx
        shr     eax,5 
        mov		nTmpAlpha, eax
		pop     edx  
		pop     eax 
   
		and		eax, 0x1f
		mov     ecx, eax
		push	eax
		push    edx

loc_DrawFont_Loop1:

		push	ecx
		mov     ecx, nColor				// ecx = ...rgb
		mov		ax, cx					// eax = ...rgb
		sal		eax, 16					// eax = rgb...
		mov		ax, cx					// eax = rgbrgb
		and		eax, nMask32			// eax = .g.r.b

		mov		cx, [edi]				// ecx = ...rgb
		mov		bx, cx					// ebx = ...rgb
		sal		ebx, 16					// ebx = rgb...
		mov		bx, cx					// ebx = rgbrgb
		and		ebx, nMask32			// ebx = .g.r.b

		mov		ecx, nTmpAlpha 			// ecx = nAlpha
		mul		ecx						// eax = eax*ecx
		neg		ecx						// ecx = -nAlpha
		add		ecx, 0x20				// ecx = 32-nAlpha
		xchg	eax, ebx				// exchange eax,ebx
		mul		ecx						// eax = eax*ecx
		add		eax, ebx				// eax = eax + ebx
		sar		eax, 5					// eax = eax/32
		and     eax, nMask32			// eax = .g.r.b

		mov     cx, ax					// ecx = ...r.b
		sar     eax, 16					// eax = ....g.
		or      ax, cx					// eax = ...rgb
        stosw                       

		pop		ecx
        loop    loc_DrawFont_Loop1

        pop     edx
        pop     eax

		sub		edx, eax
		jg		loc_DrawFont_0101
		add		edi, nNextLine
		dec		Clipper.height
		jg		loc_DrawFont_0100
		jmp		loc_DrawFont_exit

loc_DrawFont_exit:
	}
	pCanvas->UnlockCanvas();
}

//---------------------------------------------------------------------------
// 函数:	DrawFont
// 功能:	绘制带8级Alpha的字体
// 参数:	KDrawNode*, KCanvas* 
// 返回:	void
//---------------------------------------------------------------------------
void g_DrawFontWithBorder(void* node, void* canvas)
{
	KDrawNode* pNode = (KDrawNode *)node;
	KCanvas* pCanvas = (KCanvas *)canvas;
	
	int nX = pNode->m_nX;// x coord
	int nY = pNode->m_nY;// y coord
	int nWidth = pNode->m_nWidth;// width of font
	int nHeight = pNode->m_nHeight;// height of font
	int nColor = pNode->m_nColor;// color of font
	int nBorderColor = pNode->m_nAlpha;// color of border
	void* lpFont = pNode->m_pBitmap;// font pointer
	//t筼 clip tr猲 khung tranh canvas
	KClipper Clipper;
	if (!pCanvas->MakeClip(nX, nY, nWidth, nHeight, &Clipper))
		return;

	int nPitch;
	void* lpBuffer = pCanvas->LockCanvas(nPitch);
	if (lpBuffer == NULL)
		return;
	UINT nCheckColor = nColor & 0xf800;
	if(nCheckColor == 0xf800)
		nColor &= 0xf7ff;
	nCheckColor = nBorderColor & 0xf800;
	if(nCheckColor == 0xf800)
		nBorderColor &= 0xf7ff;
	//offset  甶 n 甶觤 xu鑞g d遪g
	int nNextLine = nPitch - Clipper.width * 2;
	//甶 n 甶觤 b総 u v?tr猲 khung tranh
	BYTE* pCVBuff = (BYTE*)lpBuffer + nPitch * Clipper.y + Clipper.x*2;
	//d?li謚 c馻 k?t?
	BYTE* pFontData = (BYTE*)lpFont;
	int nTmpLength;
	BYTE uData, uTrans, uDLen;
	
	if(!Clipper.top)
		goto	loc_DrawFont_0011;

loc_DrawFont_0008:
		nTmpLength = nWidth;

loc_DrawFont_0009:
		uData = *pFontData++;
		uData &= 0x1f;
		nTmpLength -= uData;
		if(nTmpLength > 0)
		goto	loc_DrawFont_0009;
		Clipper.top--;
		if(Clipper.top > 0)
		goto  	loc_DrawFont_0008;

loc_DrawFont_0011:
		if(!Clipper.left)
		goto	loc_DrawFont_0012;
		goto	loc_DrawFont_exit;

loc_DrawFont_0012:
		if(!Clipper.right)
		goto	loc_DrawFont_0100;
		goto	loc_DrawFont_exit;

loc_DrawFont_0100:
		nTmpLength = Clipper.width;

loc_DrawFont_0101:
		uData = *pFontData++;
		uTrans = uData >> 5;
		if(uTrans)
		goto	loc_DrawFont_0102;
		pCVBuff += uData*2;
		
		nTmpLength -= uData;
		if(nTmpLength > 0)
		goto	loc_DrawFont_0101;
		pCVBuff += nNextLine;
		Clipper.height--;
		if(Clipper.height > 0)
		goto	loc_DrawFont_0100;
		goto	loc_DrawFont_exit;

loc_DrawFont_0102:
		uData &= 0x1f;
		if(uTrans < 7)
		goto	DrawFrontWithBorder_DrawBorder;
		//v?m祏 ch輓h c馻 k?t?
		uDLen = uData;
		while(uDLen)
		{
			*((WORD*)pCVBuff) = nColor;
			pCVBuff += 2;
			--uDLen;
		}

		nTmpLength -= uData;
		if(nTmpLength > 0)
		goto	loc_DrawFont_0101;
		pCVBuff += nNextLine;
		Clipper.height--;
		if(Clipper.height > 0)
		goto	loc_DrawFont_0100;
		goto	loc_DrawFont_exit;
 
DrawFrontWithBorder_DrawBorder:		//v?m祏 vi襫 k?t?
		uDLen = uData;
		// Keep the font's 3-bit edge coverage instead of turning every edge
		// pixel into opaque black.  This avoids one-pixel outline strobing.
		const int nBorderAlpha = (uTrans * 32 + 3) / 7;
		while(uDLen)
		{
			WORD* pPixel = (WORD*)pCVBuff;
			*pPixel = BlendFontPixel565(*pPixel, (WORD)nBorderColor, nBorderAlpha);
			pCVBuff += 2;
			--uDLen;
		}

		nTmpLength -= uData;
		if(nTmpLength > 0)
		goto	loc_DrawFont_0101;
		pCVBuff += nNextLine;
		Clipper.height--;
		if(Clipper.height > 0)
		goto	loc_DrawFont_0100;
		goto	loc_DrawFont_exit;

loc_DrawFont_exit:
	pCanvas->UnlockCanvas();
}


//---------------------------------------------------------------------------
// 函数:	DrawFontSolid
// 功能:	绘制实心字体
// 参数:	KDrawNode*, KCanvas* 
// 返回:	void
//---------------------------------------------------------------------------
void g_DrawFontSolid(void* node, void* canvas)
{
	KDrawNode* pNode = (KDrawNode *)node;
	KCanvas* pCanvas = (KCanvas *)canvas;
	
	long nX = pNode->m_nX;// x coord
	long nY = pNode->m_nY;// y coord
	long nWidth = pNode->m_nWidth;// width of font
	long nHeight = pNode->m_nHeight;// height of font
	long nColor = pNode->m_nColor;// color of font
	long nAlpha = pNode->m_nAlpha&0x001f;// nAlpha值
	void* lpFont = pNode->m_pBitmap;// font pointer

	// 对绘制区域进行裁剪
	KClipper Clipper;
	if (!pCanvas->MakeClip(nX, nY, nWidth, nHeight, &Clipper))
		return;

	int nPitch;
	void* lpBuffer = pCanvas->LockCanvas(nPitch);
	if (lpBuffer == NULL)
		return;

	long nMask32 = pCanvas->m_nMask32;// RGB mask 32bit

	// 计算屏幕下一行的偏移
	long nNextLine = nPitch - Clipper.width * 2;
	
	__asm
	{
//---------------------------------------------------------------------------
// 计算 EDI 指向屏幕起点的偏移量 (以字节计)
// edi = nPitch * Clipper.y + nX * 2 + lpBuffer
//---------------------------------------------------------------------------
		mov		eax, nPitch
		mov		ebx, Clipper.y
		mul		ebx
		mov     ebx, Clipper.x
		add		ebx, ebx
		add     eax, ebx
		mov 	edi, lpBuffer
		add		edi, eax
//---------------------------------------------------------------------------
// 初始化 ESI 指向图块数据起点 (跳过 Clipper.top 行图形数据)
//---------------------------------------------------------------------------
		mov		esi, lpFont
		mov		ecx, Clipper.top
		or		ecx, ecx
		jz		loc_DrawFontSolid_0011
		xor		eax, eax

loc_DrawFontSolid_0008:

		mov		edx, nWidth

loc_DrawFontSolid_0009:

		mov     al, [esi]
		inc     esi
		and		al, 0x1f
		sub		edx, eax
		jg		loc_DrawFontSolid_0009
		dec     ecx
		jg  	loc_DrawFontSolid_0008
//---------------------------------------------------------------------------
// jump acorrd Clipper.left, Clipper.right
//---------------------------------------------------------------------------
loc_DrawFontSolid_0011:

		mov		eax, Clipper.left
		or		eax, eax
		jz		loc_DrawFontSolid_0012
		jmp		loc_DrawFontSolid_exit

loc_DrawFontSolid_0012:

		mov		eax, Clipper.right
		or		eax, eax
		jz		loc_DrawFontSolid_0100
		jmp		loc_DrawFontSolid_exit
//---------------------------------------------------------------------------
// Clipper.left  == 0
// Clipper.right == 0
//---------------------------------------------------------------------------
loc_DrawFontSolid_0100:

		mov		edx, Clipper.width

loc_DrawFontSolid_0101:

		xor		eax, eax
		mov     al, [esi]
		inc     esi
		mov		ebx, eax
		shr		ebx, 5
		or		ebx, ebx
		jnz		loc_DrawFontSolid_0102

		add		edi, eax
		add		edi, eax
		sub		edx, eax
		jg		loc_DrawFontSolid_0101
		add		edi, nNextLine
		dec		Clipper.height
		jg		loc_DrawFontSolid_0100
		jmp		loc_DrawFontSolid_exit

loc_DrawFontSolid_0102:

        and		eax, 0x1f
		mov     ecx, eax
		push	eax
		push    edx

loc_DrawFontSolid_Loop1:

		push	ecx
		mov     ecx, nColor				// ecx = ...rgb
		mov		ax, cx					// eax = ...rgb
		sal		eax, 16					// eax = rgb...
		mov		ax, cx					// eax = rgbrgb
		and		eax, nMask32			// eax = .g.r.b

		mov		cx, [edi]				// ecx = ...rgb
		mov		bx, cx					// ebx = ...rgb
		sal		ebx, 16					// ebx = rgb...
		mov		bx, cx					// ebx = rgbrgb
		and		ebx, nMask32			// ebx = .g.r.b

		mov		ecx, nAlpha 			// ecx = nAlpha
		mul		ecx						// eax = eax*ecx
		neg		ecx						// ecx = -nAlpha
		add		ecx, 0x20				// ecx = 32-nAlpha
		xchg	eax, ebx				// exchange eax,ebx
		mul		ecx						// eax = eax*ecx
		add		eax, ebx				// eax = eax + ebx
		sar		eax, 5					// eax = eax/32
		and     eax, nMask32			// eax = .g.r.b

		mov     cx, ax					// ecx = ...r.b
		sar     eax, 16					// eax = ....g.
		or      ax, cx					// eax = ...rgb
        stosw                       

		pop		ecx
        loop    loc_DrawFontSolid_Loop1

        pop     edx
        pop     eax

		sub		edx, eax
		jg		loc_DrawFontSolid_0101
		add		edi, nNextLine
		dec		Clipper.height
		jg		loc_DrawFontSolid_0100
		jmp		loc_DrawFontSolid_exit

loc_DrawFontSolid_exit:
	}
	pCanvas->UnlockCanvas();
}
//---------------------------------------------------------------------------
