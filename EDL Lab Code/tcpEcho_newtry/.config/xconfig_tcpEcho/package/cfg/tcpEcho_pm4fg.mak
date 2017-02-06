#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = gnu.targets.arm.M4F{1,0,4.9,3
#
ifeq (,$(MK_NOGENDEPS))
-include package/cfg/tcpEcho_pm4fg.om4fg.dep
package/cfg/tcpEcho_pm4fg.om4fg.dep: ;
endif

package/cfg/tcpEcho_pm4fg.om4fg: | .interfaces
package/cfg/tcpEcho_pm4fg.om4fg: package/cfg/tcpEcho_pm4fg.c package/cfg/tcpEcho_pm4fg.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm4fg $< ...
	$(gnu.targets.arm.M4F.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DPART_TM4C1294NCPDT -D_POSIX_SOURCE -Dgcc -DTIVAWARE -I"C:/ti/tirtos_tivac_2_16_01_14/products/ndk_2_25_00_09/packages/ti/ndk/inc/bsd" -I"C:/Users/D-1/Desktop/Kurian/tcpEcho_newtry_kurian" -I"C:/ti/tirtos_tivac_2_16_01_14/products/TivaWare_C_Series-2.1.1.71b" -I"C:/ti/tirtos_tivac_2_16_01_14/products/bios_6_45_02_31/packages/ti/sysbios/posix" -I"C:/ti/ccsv6/tools/compiler/gcc-arm-none-eabi-4_9-2015q3/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MD -std=c99 -c   -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__   -Dxdc_cfg__xheader__='"xconfig_tcpEcho/package/cfg/tcpEcho_pm4fg.h"'  -Dxdc_target_name__=M4F -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_9_3  -O2  -IC:/ti/tirtos_tivac_2_16_01_14/products/bios_6_45_02_31/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/cfg/tcpEcho_pm4fg.om4fg: export LD_LIBRARY_PATH=

package/cfg/tcpEcho_pm4fg.sm4fg: | .interfaces
package/cfg/tcpEcho_pm4fg.sm4fg: package/cfg/tcpEcho_pm4fg.c package/cfg/tcpEcho_pm4fg.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm4fg -S $< ...
	$(gnu.targets.arm.M4F.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DPART_TM4C1294NCPDT -D_POSIX_SOURCE -Dgcc -DTIVAWARE -I"C:/ti/tirtos_tivac_2_16_01_14/products/ndk_2_25_00_09/packages/ti/ndk/inc/bsd" -I"C:/Users/D-1/Desktop/Kurian/tcpEcho_newtry_kurian" -I"C:/ti/tirtos_tivac_2_16_01_14/products/TivaWare_C_Series-2.1.1.71b" -I"C:/ti/tirtos_tivac_2_16_01_14/products/bios_6_45_02_31/packages/ti/sysbios/posix" -I"C:/ti/ccsv6/tools/compiler/gcc-arm-none-eabi-4_9-2015q3/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MD -std=c99 -c   -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__   -Dxdc_cfg__xheader__='"xconfig_tcpEcho/package/cfg/tcpEcho_pm4fg.h"'  -Dxdc_target_name__=M4F -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_9_3  -O2   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/cfg/tcpEcho_pm4fg.sm4fg: export LD_LIBRARY_PATH=

clean,m4fg ::
	-$(RM) package/cfg/tcpEcho_pm4fg.om4fg
	-$(RM) package/cfg/tcpEcho_pm4fg.sm4fg

tcpEcho.pm4fg: package/cfg/tcpEcho_pm4fg.om4fg package/cfg/tcpEcho_pm4fg.mak

clean::
	-$(RM) package/cfg/tcpEcho_pm4fg.mak
