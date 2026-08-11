#ifndef JX2015_FPS60_TRACE_H
#define JX2015_FPS60_TRACE_H

#include <windows.h>
#include <stdio.h>
#include <stdarg.h>
#include <string.h>

// Diagnostic tracing is intentionally enabled for the current FPS60 audit.
// Keep each file open and buffered: opening/closing it for every rendered frame
// changes the timings that are being measured.
#define FPS60_ENABLE_DIAGNOSTICS 1

static void FPS60TraceWrite(const char* fileName, const char* category,
                            const char* format, va_list args)
{
    struct TraceFile
    {
        const char* name;
        FILE* file;
        DWORD lastFlush;
        char buffer[64 * 1024];
    };
    static TraceFile files[2] =
    {
        { "fps60_profiler.log", NULL, 0, { 0 } },
        { "fps60_diag.log", NULL, 0, { 0 } }
    };

    TraceFile* trace = (strcmp(fileName, files[1].name) == 0) ? &files[1] : &files[0];
    if (!trace->file)
    {
        trace->file = fopen(trace->name, "a");
        if (!trace->file)
            return;
        setvbuf(trace->file, trace->buffer, _IOFBF, sizeof(trace->buffer));
        trace->lastFlush = GetTickCount();
    }

    SYSTEMTIME time;
    GetLocalTime(&time);
    fprintf(trace->file, "%02u:%02u:%02u.%03u [%-10s] T=%lu ",
        time.wHour, time.wMinute, time.wSecond, time.wMilliseconds,
        category, (unsigned long)GetTickCount());
    vfprintf(trace->file, format, args);
    fputc('\n', trace->file);

    const DWORD now = GetTickCount();
    if (now - trace->lastFlush >= 1000)
    {
        fflush(trace->file);
        trace->lastFlush = now;
    }
}

static void FPS60TraceLog(const char* fileName, const char* category,
                          const char* format, ...)
{
    va_list args;
    va_start(args, format);
    FPS60TraceWrite(fileName, category, format, args);
    va_end(args);
}

#endif
