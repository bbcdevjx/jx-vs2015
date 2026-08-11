#include "KWin32.h"
#include "KFilePath.h"
#include "KIniFile.h"
#include "KPakList.h"
#include "KPakFile.h"
#include <stdio.h>

struct SectionInfo { unsigned int offset, length; };
struct TrapHead { unsigned int count, reserved[2]; };
struct TrapCell
{
    unsigned char x, y, cells, reserved;
    unsigned int scriptId;
};

int main()
{
    const char* known[] = {
        "\\script\\maps\\balang\\trap\\cong2h.lua",
        "\\script\\maps\\balang\\trap\\cong4h.lua",
        "\\script\\maps\\balang\\trap\\cong8h.lua",
        "\\script\\maps\\balang\\trap\\cong10h.lua"
    };
    for (int k = 0; k < 4; ++k)
        printf("known=%08X %s\n", g_FileName2Id((char*)known[k]), known[k]);
    g_SetRootPath("E:\\JX2015\\bin\\server\\release");
    KPakList pakList;
    if (!pakList.Open("\\package.ini")) return 2;

    KIniFile ini;
    char mapPath[260] = {0};
    g_SetFilePath("\\settings");
    if (!ini.Load("MapList.ini") ||
        !ini.GetString("List", "53", "", mapPath, sizeof(mapPath))) return 3;

    char worldFile[300];
    sprintf(worldFile, "%s.wor", mapPath);
    g_SetFilePath("\\maps");
    ini.Clear();
    if (!ini.Load(worldFile)) return 4;
    RECT rect = {0};
    ini.GetRect("MAIN", "rect", &rect);
    printf("map=%s rect=%ld,%ld,%ld,%ld\n", mapPath, rect.left, rect.top, rect.right, rect.bottom);

    g_SetFilePath(mapPath);
    for (int ry = rect.top; ry <= rect.bottom; ++ry)
    for (int rx = rect.left; rx <= rect.right; ++rx)
    {
        char file[400];
        sprintf(file, "%s\\v_%03d\\%03d_Region_S.dat", mapPath, ry, rx);
        KPakFile data;
        if (!data.Open(file)) continue;
        unsigned int sectionCount = 0;
        if (data.Read(&sectionCount, 4) != 4 || sectionCount < 2 || sectionCount > 64) continue;
        SectionInfo sections[64] = {0};
        if (data.Read(sections, sectionCount * sizeof(SectionInfo)) != sectionCount * sizeof(SectionInfo)) continue;
        unsigned int headSize = 4 + sectionCount * sizeof(SectionInfo);
        if (!sections[1].length) continue;
        data.Seek(headSize + sections[1].offset, FILE_BEGIN);
        TrapHead head = {0};
        if (data.Read(&head, sizeof(head)) != sizeof(head)) continue;
        printf("region=%d,%d trapBytes=%u count=%u\n", rx, ry, sections[1].length, head.count);
        for (unsigned int i = 0; i < head.count; ++i)
        {
            TrapCell cell = {0};
            if (data.Read(&cell, sizeof(cell)) != sizeof(cell)) break;
            printf("  cell=%u,%u len=%u id=%u hex=%08X\n",
                cell.x, cell.y, cell.cells, cell.scriptId, cell.scriptId);
        }
    }
    return 0;
}
