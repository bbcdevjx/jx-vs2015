// FilterTextLib.h: interface for the CFilterTextLib class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FILTERTEXTLIB_H__A17EADC0_A233_400A_A8F4_86A333698154__INCLUDED_)
#define AFX_FILTERTEXTLIB_H__A17EADC0_A233_400A_A8F4_86A333698154__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define FILTERTEXT_STATICLIB	//use static lib
#include "../../FilterText/FilterText.h"
#ifdef _DEBUG

#else

#endif

class CFilterTextLib  
{
public:
	CFilterTextLib();
	virtual ~CFilterTextLib();

public:
	BOOL Initialize();
	BOOL Uninitialize();

private:
/*
	HMODULE m_hFilterText;

	typedef HRESULT (*LPFNCREATETEXTFILTER)(ITextFilter** ppTextFilter);
	LPFNCREATETEXTFILTER m_lpfnCreateTextFilter;
*/
public:
	HRESULT CreateTextFilter(ITextFilter** ppTextFilter);
};

#endif // !defined(AFX_FILTERTEXTLIB_H__A17EADC0_A233_400A_A8F4_86A333698154__INCLUDED_)
