################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
build-817207953: ../tcpEcho.cfg
	@echo 'Building file: $<'
	@echo 'Invoking: XDCtools'
	"/xs" --xdcpath= xdc.tools.configuro -o configPkg -t gnu.targets.arm.M4F -p ti.platforms.tiva:TM4C1294NCPDT -r release -c --compileOptions " " "$<"
	@echo 'Finished building: $<'
	@echo ' '

configPkg/linker.cmd: build-817207953
configPkg/compiler.opt: build-817207953
configPkg/: build-817207953


