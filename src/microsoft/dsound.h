/* -*- coding: utf-8; indent-tabs-mode: t; tab-width: 4; c-basic-offset: 4; -*- */

/*
 * Polaris Engine
 * Copyright (C) 2001-2024, Keiichi Tabata. All rights reserved.
 */

/*
 * DirectSound Output (DirectSound 5.0)
 *
 * [Changes]
 *  - 2004-01-10 Created. (C++)
 *  - 2016-06-05 Created. (C++ to C)
 *  - 2024-04-11 Polaris Engine
 *
 * dxguid.lib, dsound.libが必要
 */

#ifndef POLARIS_DSOUND_H
#define POLARIS_DSOUND_H

#include <windows.h>

BOOL DSInitialize(HWND hWnd);
VOID DSCleanup();

#endif
