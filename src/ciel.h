/* -*- coding: utf-8; tab-width: 8; indent-tabs-mode: t; -*- */

/*
 * Polaris Engine
 * Copyright (C) 2001-2024, Keiichi Tabata. All rights reserved.
 */

/*
 * The Ciel Direction System (Designed by Asatsuki and ktabata)
 *
 * [Changes]
 *  - 2024/03/27 Created.
 */

#ifndef POLARIS_CIEL_H
#define POLARIS_CIEL_H

#include "file.h"

void ciel_clear_hook(void);
bool ciel_serialize_hook(struct wfile *wf);
bool ciel_deserialize_hook(struct rfile *rf);

#endif
