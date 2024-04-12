/* -*- coding: utf-8; indent-tabs-mode: nil; tab-width: 4; c-basic-offset: 4; -*- */

/*
 * Polaris Engine
 * Copyright (C) 2001-2024, Keiichi Tabata. All rights reserved.
 */

/*
 * Audio Unit Sound Output
 *
 * [Changes]
 *  - 2016-06-17 Created.
 *  - 2016-07-03 Implemented the mixing feature.
 *  - 2024-04-11 Polaris Engine
 */

#ifndef POLARIS_AUNIT_H
#define POLARIS_AUNIT_H

bool init_aunit(void);
void cleanup_aunit(void);
void pause_sound(void);
void resume_sound(void);

#endif
