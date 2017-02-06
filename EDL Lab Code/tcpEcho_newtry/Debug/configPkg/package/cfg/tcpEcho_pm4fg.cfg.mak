# invoke SourceDir generated makefile for tcpEcho.pm4fg
tcpEcho.pm4fg: .libraries,tcpEcho.pm4fg
.libraries,tcpEcho.pm4fg: package/cfg/tcpEcho_pm4fg.xdl
	$(MAKE) -f C:\Users\D-1\Desktop\Kurian\tcpEcho_newtry_kurian/src/makefile.libs

clean::
	$(MAKE) -f C:\Users\D-1\Desktop\Kurian\tcpEcho_newtry_kurian/src/makefile.libs clean

