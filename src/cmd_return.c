/* -*- coding: utf-8; tab-width: 8; indent-tabs-mode: t; -*- */

/*
 * Polaris Engine
 * Copyright (C) 2001-2024, Keiichi Tabata. All rights reserved.
 */

/*
 * [Changes]
 *  - 2018-07-22 Created.
 *  - 2024-04-11 Polaris Engine
 */

#include "polaris.h"

/*
 * returnコマンド
 */
bool return_command(void)
{
	const char *gui;
	int rp;

	/* カスタムシステムメニューGUIのgosubで、戻り先がGUIの場合 */
	gui = get_return_gui();
	if (gui != NULL) {
		if (!prepare_gui_mode(gui, false))
			return false;
		set_gui_options(true, false, false);
		start_gui_mode();
		return true;
	}

	/* リターンポイントを取得する */
	rp = pop_return_point();

	/*
	 * リターンポイントが無効な場合、エラーとする
	 *  - 最初の行でpushされると-1になる点に留意
	 */
	if (rp < -1) {
		/* エラーを出力する */
		log_script_return_error();
		log_script_exec_footer();
		return false;
	}

	/* リターンポイントの次の行に復帰する */
	if (!move_to_command_index(rp + 1)) {
		/* エラーを出力する */
		log_script_return_error();
		log_script_exec_footer();
		return false;
	}

	return true;
}
