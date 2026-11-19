#include "xprd.h"

XPrd_Config XPrd_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,dfx-decoupler-1.0", /* compatible */
		0x43c00000 /* reg */
	},
	 {
		 NULL
	}
};