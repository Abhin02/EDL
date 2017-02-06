################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LDS_SRCS += \
../EK_TM4C1294XL.lds 

CFG_SRCS += \
../tcpEcho.cfg 

C_SRCS += \
../EK_TM4C1294XL.c \
../my_tcp_no_dhcp.c \
../tcpEchoHooks.c 

OBJS += \
./EK_TM4C1294XL.o \
./my_tcp_no_dhcp.o \
./tcpEchoHooks.o 

C_DEPS += \
./EK_TM4C1294XL.d \
./my_tcp_no_dhcp.d \
./tcpEchoHooks.d 

GEN_MISC_DIRS += \
./configPkg/ 

GEN_CMDS += \
./configPkg/linker.cmd 

GEN_OPTS += \
./configPkg/compiler.opt 

GEN_FILES += \
./configPkg/linker.cmd \
./configPkg/compiler.opt 

GEN_FILES__QUOTED += \
"configPkg\linker.cmd" \
"configPkg\compiler.opt" 

GEN_MISC_DIRS__QUOTED += \
"configPkg\" 

C_DEPS__QUOTED += \
"EK_TM4C1294XL.d" \
"my_tcp_no_dhcp.d" \
"tcpEchoHooks.d" 

OBJS__QUOTED += \
"EK_TM4C1294XL.o" \
"my_tcp_no_dhcp.o" \
"tcpEchoHooks.o" 

C_SRCS__QUOTED += \
"../EK_TM4C1294XL.c" \
"../my_tcp_no_dhcp.c" \
"../tcpEchoHooks.c" 


