/*
 * Polaris Engine
 * Copyright (C) 2001-2024, Keiichi Tabata. All rights reserved.
 */

/*
 * Text to speech.
 */

#ifndef POLARIS_TTS_SAPI_H
#define POLARIS_TTS_SAPI_H

#ifdef __cplusplus
extern "C" {
#endif

void InitSAPI(void);
void SpeakSAPI(const wchar_t *text);

#ifdef __cplusplus
};
#endif

#endif
