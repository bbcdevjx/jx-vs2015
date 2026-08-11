// Compatibility exports required by the VC6-built Berkeley DB 4.1 library.
// VS2015 moved these CRT data exports behind accessor functions.
#include <stdio.h>
#include <ctype.h>

#ifdef _pctype
#undef _pctype
#endif
#ifdef __mb_cur_max
#undef __mb_cur_max
#endif

extern "C"
{
    FILE _iob[3] = { *stdin, *stdout, *stderr };
    const unsigned short* _pctype = __pctype_func();
    int __mb_cur_max = 1;
}
