/* -*- coding: utf-8; indent-tabs-mode: t; tab-width: 4; c-basic-offset: 4; -*- */

/*
 * Polaris Engine
 * Copyright (C) 2001-2024, Keiichi Tabata. All rights reserved.
 */

/*
 * [Changes]
 *  - 2021/08/03 Created.
 *  - 2024-04-11 Polaris Engine
 */

#ifndef POLARIS_D3D_H
#define POLARIS_D3D_H

#include "../polaris.h"

#include <windows.h>

void init_midi(void);
void cleanup_midi(void);
bool play_midi(const char *dir, const char *fname);
void stop_midi(void);
void sync_midi(void);

#endif
