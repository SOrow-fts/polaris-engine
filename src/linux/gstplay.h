/* -*- c-basic-offset: 2; indent-tabs-mode: nil; -*- */

/*
 * Polaris Engine
 * Copyright (C) 2001-2024, Keiichi Tabata. All rights reserved.
 */

/*
 * [Changes]
 *  - 2022-10-24 Created.
 *  - 2024-04-11 Polaris Engine
 */

#ifndef POLARIS_GSTPLAY_H
#define POLARIS_GSTPLAY_H

#include <X11/Xlib.h>

void
gstplay_init (int argc, char *argv[]);

void
gstplay_play (const char *fname, Window window);

void
gstplay_stop (void);

int
gstplay_is_playing (void);

void
gstplay_loop_iteration (void);

#endif
