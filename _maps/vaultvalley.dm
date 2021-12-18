//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\VaultValley\vaultvalley-sky-3.dmm"
		#include "map_files\VaultValley\vaultvalley-surface-2.dmm"
		#include "map_files\VaultValley\vaultvalley-under-1.dmm"
		#include "map_files\VaultValley\dungeons.dmm"

		#ifdef TRAVISBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
