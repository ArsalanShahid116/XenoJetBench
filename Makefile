APPLICATIONS = XenoJetBench

MODULES =
ifeq ($(KERNELRELEASE),)
ifneq ($(APPLICATIONS),)

### Default Xenomai installation path
XENO ?= /usr/xenomai

XENOCONFIG=$(shell PATH=$(XENO):$(XENO)/bin:$(PATH) which xeno-config 2>/dev/null)

### Sanity check
ifeq ($(XENOCONFIG),)
all::
	@echo ">>> Invoke make like this: \"make XENO=/path/to/xeno-config\" <<<"
	@echo
endif


CC=$(shell $(XENOCONFIG) --cc)
CFLAGS = -Wall -g -fopenmp
CPPFLAGS=$(shell $(XENOCONFIG) --skin=native --cflags) $(MY_CFLAGS)

LDFLAGS=$(MY_LDFLAGS)
LDLIBS=$(shell $(XENOCONFIG) --skin=native --ldflags)

LOADLIBES+=-Xlinker -rpath -Xlinker $(shell $(XENOCONFIG) --libdir)

all:: $(APPLICATIONS)
	@echo 
	@echo  Benchmark compilation Successful 
	@echo  Use [ make clean ]  to clear compilation
	@echo 

clean::
	$(RM) $(APPLICATIONS) *.o

endif
endif

###### KERNEL MODULE BUILD (no change required normally) ######
ifneq ($(MODULES),)

### Default to sources of currently running kernel
KSRC ?= /lib/modules/$(shell uname -r)/build

OBJS     := ${patsubst %, %.o, $(MODULES)}
CLEANMOD := ${patsubst %, .%*, $(MODULES)}
PWD      := $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)

### Kernel 2.6 or 3.0
PATCHLEVEL:=$(shell sed 's/PATCHLEVEL = \(.*\)/\1/;t;d' $(KSRC)/Makefile)
VERSION:=$(shell sed 's/VERSION = \(.*\)/\1/;t;d' $(KSRC)/Makefile)
ifneq ($(VERSION).$(PATCHLEVEL),2.4)

obj-m        := $(OBJS)
EXTRA_CFLAGS := -I$(KSRC)/include/xenomai -I$(KSRC)/include/xenomai/posix $(ADD_CFLAGS)

all:	$(MAIN) 

all::
	$(MAKE) -C $(KSRC) SUBDIRS=$(PWD) modules

### Kernel 2.4
else

ARCH    ?= $(shell uname -i)
INCLUDE := -I$(KSRC)/include/xenomai -I$(KSRC)/include/xenomai/compat -I$(KSRC)/include/xenomai/posix
CFLAGS  += $(shell $(MAKE) -s -C $(KSRC) CC=$(CC) ARCH=$(ARCH) SUBDIRS=$(PWD) modules) $(INCLUDE) 

all:: $(OBJS)

endif

## Target for capturing 2.4 module CFLAGS
modules:
	@echo "$(CFLAGS)"

clean::
	$(RM) $(CLEANMOD) *.o *.ko *.mod.c Module*.symvers Module.markers modules.order
	$(RM) -R .tmp*

endif
