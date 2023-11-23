include Makeconfig
vfiles = $(files:.c=.o)

libinit: $(vfiles)
	ar rcs $(libname) $(vfiles) $(libheaderfile)

libclean:
ifneq ("$(wildcard $(vfiles))","")
	rm $(vfiles)
endif
ifneq ("$(wildcard $(libname))","")
	rm $(libname)
endif

