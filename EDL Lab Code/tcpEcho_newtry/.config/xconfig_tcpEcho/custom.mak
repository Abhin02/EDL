## THIS IS A GENERATED FILE -- DO NOT EDIT
.configuro: .libraries,m4fg linker.cmd package/cfg/tcpEcho_pm4fg.om4fg

# To simplify configuro usage in makefiles:
#     o create a generic linker command file name 
#     o set modification times of compiler.opt* files to be greater than
#       or equal to the generated config header
#
linker.cmd: package/cfg/tcpEcho_pm4fg.xdl
	$(SED) 's"^\"\(package/cfg/tcpEcho_pm4fgcfg.cmd\)\"$""\"C:/Users/D-1/Desktop/Kurian/tcpEcho_newtry_kurian/.config/xconfig_tcpEcho/\1\""' package/cfg/tcpEcho_pm4fg.xdl > $@
	-$(SETDATE) -r:max package/cfg/tcpEcho_pm4fg.h compiler.opt compiler.opt.defs
