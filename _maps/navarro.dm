#define FORCE_MAP "_maps/navarro.json"

#if !defined(MAP_FILE)

		#if !defined(MAP_OVERRIDE_FILES)
			#define MAP_OVERRIDE_FILES
			#include "map_files\Navarro\job_changes.dm"
		#endif

#endif
