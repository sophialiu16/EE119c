/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_102(char*, char *);
extern void execute_238(char*, char *);
extern void execute_239(char*, char *);
extern void execute_46(char*, char *);
extern void execute_47(char*, char *);
extern void execute_49(char*, char *);
extern void execute_50(char*, char *);
extern void execute_53(char*, char *);
extern void execute_55(char*, char *);
extern void execute_56(char*, char *);
extern void execute_68(char*, char *);
extern void execute_69(char*, char *);
extern void execute_92(char*, char *);
extern void execute_58(char*, char *);
extern void execute_60(char*, char *);
extern void execute_62(char*, char *);
extern void execute_64(char*, char *);
extern void execute_66(char*, char *);
extern void execute_71(char*, char *);
extern void execute_73(char*, char *);
extern void execute_75(char*, char *);
extern void execute_77(char*, char *);
extern void execute_79(char*, char *);
extern void execute_82(char*, char *);
extern void execute_84(char*, char *);
extern void execute_86(char*, char *);
extern void execute_88(char*, char *);
extern void execute_90(char*, char *);
extern void execute_94(char*, char *);
extern void execute_95(char*, char *);
extern void execute_96(char*, char *);
extern void execute_97(char*, char *);
extern void execute_98(char*, char *);
extern void execute_99(char*, char *);
extern void execute_100(char*, char *);
extern void execute_101(char*, char *);
extern void execute_232(char*, char *);
extern void execute_233(char*, char *);
extern void execute_234(char*, char *);
extern void execute_105(char*, char *);
extern void execute_167(char*, char *);
extern void execute_107(char*, char *);
extern void execute_109(char*, char *);
extern void execute_111(char*, char *);
extern void execute_113(char*, char *);
extern void execute_115(char*, char *);
extern void execute_117(char*, char *);
extern void execute_119(char*, char *);
extern void execute_121(char*, char *);
extern void execute_123(char*, char *);
extern void execute_125(char*, char *);
extern void execute_127(char*, char *);
extern void execute_129(char*, char *);
extern void execute_131(char*, char *);
extern void execute_133(char*, char *);
extern void execute_135(char*, char *);
extern void execute_137(char*, char *);
extern void execute_139(char*, char *);
extern void execute_141(char*, char *);
extern void execute_143(char*, char *);
extern void execute_145(char*, char *);
extern void execute_147(char*, char *);
extern void execute_149(char*, char *);
extern void execute_151(char*, char *);
extern void execute_153(char*, char *);
extern void execute_155(char*, char *);
extern void execute_157(char*, char *);
extern void execute_159(char*, char *);
extern void execute_161(char*, char *);
extern void execute_163(char*, char *);
extern void execute_165(char*, char *);
extern void execute_236(char*, char *);
extern void execute_237(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_31(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_33(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[78] = {(funcp)execute_102, (funcp)execute_238, (funcp)execute_239, (funcp)execute_46, (funcp)execute_47, (funcp)execute_49, (funcp)execute_50, (funcp)execute_53, (funcp)execute_55, (funcp)execute_56, (funcp)execute_68, (funcp)execute_69, (funcp)execute_92, (funcp)execute_58, (funcp)execute_60, (funcp)execute_62, (funcp)execute_64, (funcp)execute_66, (funcp)execute_71, (funcp)execute_73, (funcp)execute_75, (funcp)execute_77, (funcp)execute_79, (funcp)execute_82, (funcp)execute_84, (funcp)execute_86, (funcp)execute_88, (funcp)execute_90, (funcp)execute_94, (funcp)execute_95, (funcp)execute_96, (funcp)execute_97, (funcp)execute_98, (funcp)execute_99, (funcp)execute_100, (funcp)execute_101, (funcp)execute_232, (funcp)execute_233, (funcp)execute_234, (funcp)execute_105, (funcp)execute_167, (funcp)execute_107, (funcp)execute_109, (funcp)execute_111, (funcp)execute_113, (funcp)execute_115, (funcp)execute_117, (funcp)execute_119, (funcp)execute_121, (funcp)execute_123, (funcp)execute_125, (funcp)execute_127, (funcp)execute_129, (funcp)execute_131, (funcp)execute_133, (funcp)execute_135, (funcp)execute_137, (funcp)execute_139, (funcp)execute_141, (funcp)execute_143, (funcp)execute_145, (funcp)execute_147, (funcp)execute_149, (funcp)execute_151, (funcp)execute_153, (funcp)execute_155, (funcp)execute_157, (funcp)execute_159, (funcp)execute_161, (funcp)execute_163, (funcp)execute_165, (funcp)execute_236, (funcp)execute_237, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_1, (funcp)transaction_2, (funcp)transaction_31, (funcp)transaction_33};
const int NumRelocateId= 78;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/MixerTB_behav/xsim.reloc",  (void **)funcTab, 78);
	iki_vhdl_file_variable_register(dp + 19240);
	iki_vhdl_file_variable_register(dp + 19296);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/MixerTB_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/MixerTB_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/MixerTB_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/MixerTB_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/MixerTB_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
