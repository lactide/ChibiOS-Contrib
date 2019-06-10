ifeq ($(USE_SMART_BUILD),yes)

# Configuration files directory
ifeq ($(CONFDIR),)
  CONFDIR = .
endif

HALCONF := $(strip $(shell cat $(CONFDIR)/halconf.h $(CONFDIR)/halconf_community.h | egrep -e "\#define"))

# List of all the NUMICRO1x platform files.
PLATFORMSRC  = ${CHIBIOS}/os/hal/ports/common/ARMCMx/nvic.c \
               ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD/hal_st_lld.c \
               ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD/hal_lld.c

ifneq ($(findstring HAL_USE_PAL TRUE,$(HALCONF)),)
PLATFORMSRC += ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD/hal_pal_lld.c
endif
ifneq ($(findstring HAL_USE_SERIAL TRUE,$(HALCONF)),)
PLATFORMSRC += ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD/UARTv1/hal_serial_lld.c
endif
ifneq ($(findstring HAL_USE_USB TRUE,$(HALCONF)),)
PLATFORMSRC += ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD/hal_usb_lld.c
endif
else
PLATFORMSRC  = ${CHIBIOS}/os/hal/ports/common/ARMCMx/nvic.c \
               ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD/hal_lld.c \
               ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD/hal_pal_lld.c \
               ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD/UARTv1/hal_serial_lld.c \
               ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD/hal_st_lld.c \
               ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD/hal_usb_lld.c
endif

# Required include directories
PLATFORMINC = ${CHIBIOS}/os/hal/ports/common/ARMCMx \
              ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/NUC123 \
              ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD \
              ${CHIBIOS_CONTRIB}/os/hal/ports/NUMICRO/LLD/UARTv1

# Shared variables
ALLCSRC += $(PLATFORMSRC)
ALLINC  += $(PLATFORMINC)
