# List of the ChibiOS generic NuMicro NUC140 startup and CMSIS files.
STARTUPSRC = $(CHIBIOS)/os/common/startup/ARMCMx/compilers/GCC/crt1.c \
             $(CHIBIOS)/os/common/startup/ARMCMx/compilers/GCC/vectors.c

STARTUPASM = $(CHIBIOS)/os/common/startup/ARMCMx/compilers/GCC/crt0_v6m.S

STARTUPINC = $(CHIBIOS_CONTRIB)/os/common/startup/ARMCMx/devices/NUC100Series \
             $(CHIBIOS)/os/common/ext/CMSIS/include \
             $(CHIBIOS_CONTRIB)/os/common/ext/CMSIS/NUMICRO

STARTUPLD  = $(CHIBIOS_CONTRIB)/os/common/startup/ARMCMx/compilers/GCC/ld
